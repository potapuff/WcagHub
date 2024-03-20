require 'sinatra'
require 'sinatra/activerecord'
require 'yaml'

set :static_cache_control, [:public, max_age: 60 * 60 * 24 * 365]

class WcagHub < Sinatra::Base
  ENV['RACK_ENV'] ||= 'development'
  environments = YAML.load(File.read('config/database.yml'))
  ActiveRecord::Base.establish_connection(environments[ENV['RACK_ENV']])

  Dir['models/*.rb'].each { |file| require_relative file }

  get '/' do
    @page = page("Загальні результати")
    @axes = AxeGroup.all
    @waves = Wave.all.index_by{|x| x.key}
    @axe_details_grouped = AxeDetail.group(:key).pluck(:key, Arel.sql("count(*)")).to_h
    erb :index, layout: :layout
  end

  get "/show/:url" do
    @axe = AxeGroup.find(params[:url])
    @page = page(urlfy(@axe.url))
    @page.subtitle = tag(:a, '↗️', href: @axe.url, target: '_blank', "aria-label"=>"Перейти на сайт", ref: "noopener noreferrer")
    @axe_details = AxeDetail.where(key: @axe.key)
    erb :show, layout: :layout
  end

  not_found do
    @page = page("404")
    erb :not_found, layout: :layout
  end

  error do
    @page = pager("Помилка")
    erb :error, layout: :layout
  end

  helpers do

    def h(text)
      Rack::Utils.escape_html(text)
    end

    def wcag_link(criteria)
      wrule = WcagRule[criteria]
      wrule ? tag(:a, criteria, href: wrule.url, class:'badge', target:'_blank') : tag(:span, criteria, class:'badge')
    end

    def tag(name, content, options={})
      "<#{name} #{options.to_a.map{|k,v| "#{k}=\"#{h(v)}\""}.join(' ')}>#{h(content)}</#{name}>"
    end

    def urlfy(text)
      text.sub(/https?:\/\//,'').sub(/\W+$/,'').downcase
    end
  end

  private
  def page(title)
    @page = OpenStruct.new(
      title: title,
      description: "Study of web accessibility of Ukrainian educational institutions' websites",
      keywords: "WCAG, Axe, Accessibility, Ukraine",
      image: "//images/logo.svg",
      url: request.url,
    )
  end

end