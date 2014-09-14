class FormBuilder < ActionView::Helpers::FormBuilder
  EMAIL_OPTIONS = { autocapitalize: 'off', autocomplete: 'off', autocorrect: 'off' }

  def label(method, text = nil, options = {}, &block)
    text = (text || method.to_s.humanize.titleize)
    unless object.nil?
      errors = object.errors[method.to_sym]
      if errors.present?
        text += " <small>#{errors.is_a?(Array) ? errors.first : errors}</small>"
        options[:class] ||= 'error'
      end
    end
    super(method, text.html_safe, options, &block)
  end

  def email_field(name, options={})
    options[:class] ||= 'error' if object.errors[name.to_sym].present?
    super(name, EMAIL_OPTIONS.merge(options))
  end

  %w(phone text password).each do |field_type|
    class_eval %Q{
      def #{field_type}_field(name, options={})
        (options[:class] ||= '') << ' error' if object.errors[name.to_sym].present?
        super(name, options)
      end
    }
  end
end
