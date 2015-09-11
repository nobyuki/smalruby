# -*- coding: utf-8 -*-

module Smalruby
  # ステージを表現するクラス
  class Stage < Canvas
    attr_reader :stage_color

    def initialize(options = {})
      defaults = {
        color: 'white'
      }
      opts = Util.process_options(options, defaults)

      super(opts.reject { |k, _| defaults.keys.include?(k) })

      @stage_color = opts[:color]

      # HACK: ステージを一番最初に描画する
      World.instance.objects.delete(self)
      World.instance.objects.unshift(self)
      World.instance.current_stage = self

      fill(color: opts[:color])
    end
  end
end
