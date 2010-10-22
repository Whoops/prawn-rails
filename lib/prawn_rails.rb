require 'prawn'
require 'prawn/layout'
require 'prawn/security'

module Prawn
  module Rails
    
    module PrawnHelper
      
      def prawn_document(opts={})
        pdf = (opts.delete(:renderer) || Prawn::Document).new
        yield pdf if block_given?
        
        pdf
      end
      
    end
    
    class TemplateHandler < ActionView::Template::Handler
      self.default_format = :pdf
      
      def self.call(template)
        "#{template.source.strip}.render"        
      end
      
    end
    
  end
end

Mime::Type.register_alias "application/pdf", :pdf
ActionView::Template.register_template_handler(:prawn, Prawn::Rails::TemplateHandler)
ActionView::Base.send(:include, Prawn::Rails::PrawnHelper)