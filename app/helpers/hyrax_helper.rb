module HyraxHelper
  include ::BlacklightHelper
  include Hyrax::BlacklightOverride
  include Hyrax::HyraxHelperBehavior

  def url_for_document(doc, _options = {})
    "catalog/#{doc.id}"
  end

  # Stop Blacklight js skulduggery where it redirects away from our custom route
  def session_tracking_path(_document, _params); end
end
