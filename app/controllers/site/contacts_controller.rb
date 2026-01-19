class Site::ContactsController < SiteController
  protect_from_forgery except: :create
  skip_before_action :verify_authenticity_token, only: [ :create ]
  def create
    @profiles = Profile.all
    @footers = Footer.all
    @about_companies = AboutCompany.all
    @card_services = CardService.all
    @card_teches = CardTech.all
    @card_diffs = CardDiff.all
    @contact = Contact.new(contact_params)

    begin
      unless verify_recaptcha(action: "contact", minimum_score: 0.5, model: @contact)
        flash.now[:alert] = "Falha na verificação do reCAPTCHA. Por favor, tente novamente."
        render "site/welcome/index" and return
      end
    rescue Recaptcha::RecaptchaError => e
      flash.now[:alert] = "Houve um erro ao verificar o reCAPTCHA. Por favor, tente novamente."
      render "site/welcome/index" and return
    end

    if @contact.save
      flash.now[:notice] = "Mensagem enviada com sucesso! Entraremos em contato em breve."
      @contact = Contact.new
      render "site/welcome/index"
    else
      flash.now[:alert] = "Houve um erro ao enviar sua mensagem. Por favor, verifique os campos e tente novamente."
      render "site/welcome/index"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end
