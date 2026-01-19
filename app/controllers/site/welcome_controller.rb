class Site::WelcomeController < SiteController
  def index
    @profiles = Profile.all
    @footers = Footer.all
    @about_companies = AboutCompany.all
    @card_services = CardService.all
    @card_teches = CardTech.all
    @card_diffs = CardDiff.all
    @contact = Contact.new
  end
end
