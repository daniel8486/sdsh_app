# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding default profile..."

spinner = TTY::Spinner.new("[:spinner] Seeding database...", format: :pulse)
spinner.spin

profile = Profile.find_or_create_by!(
  title: "Inovação, Segurança e Performance em Tecnologia.",
  sub_title: "Transformamos ideias em soluções digitais robustas e escaláveis. Especialistas em desenvolvimento web, mobile e cyber security para impulsionar o seu negócio.",
)

avatar_logo_path = Rails.root.join("app/assets/images/logo_1.png")

if profile.avatar_logo.blank?
   profile.avatar_logo = File.open(avatar_logo_path)
   profile.save!
end

puts "Default profile seeded."

spinner = TTY::Spinner.new("[:spinner] Seeding database...", format: :pulse)
spinner.spin

puts "Seeding default Footer Info..."

footer_info = Footer.find_or_create_by!(
  first_name_company: "Sys Djam",
  second_name_company: "Soft House",
  sub_title: "Transformando ideias em soluções digitais inovadoras, seguras e escaláveis desde 2013.",
  email: "contato@sysdjamsofthouse.com.br",
  phone: "+55 (86) 99811-7271",
  location: "Rua Professor Flávio Teixeira de Abreu, Teresina - PI, Brasil",
  text_company_footer: "2013 - 2026 © Sys Djam Soft House. Todos os direitos reservados.",
)
puts "Default Footer Info seeded."

spinner = TTY::Spinner.new("[:spinner] Seeding database...", format: :pulse)
spinner.spin

puts "Seeding About Company..."

about_companies = AboutCompany.find_or_create_by!(
  title: "CONHEÇA A EMPRESA",
  sub_title: "Sobre a Sys Djam Soft House",
  text_about: " - -- IGNORE --- ",
  text_about_first: "
   A Sys Djam Soft House é uma empresa de tecnologia especializada em desenvolver soluções digitais inovadoras, seguras e de alta performance.
   Com uma equipe altamente qualificada e comprometida com a excelência, atuamos no desenvolvimento de sistemas web e mobile,
   implementação de estratégias de cyber security e infraestrutura tecnológica robusta.
  ",
  text_about_second: "
   Nossa missão é entregar soluções tecnológicas que geram resultados reais para nossos clientes, utilizando as melhores práticas do mercado,
   metodologias ágeis e tecnologias de ponta. Priorizamos a escalabilidade, segurança e qualidade em cada projeto, garantindo que sua empresa
   esteja preparada para os desafios do futuro digital.
  ",
  name_projects_delivered: "Projetos Entregues",
  projects_delivered: "100+",
  name_uptime_garanteed: "Uptime Garantido",
  uptime_garanteed: "99.9%",
  name_sastified_customers: "Clientes Satisfeitos",
  sastified_customers: "50+",
)

puts "About Company seeded."


spinner = TTY::Spinner.new("[:spinner] Seeding database...", format: :pulse)
spinner.spin

puts "Seeding Services..."


card_service = CardService.find_or_create_by!(
  title_service: "O QUE FAZEMOS",
  sub_title: "Nossos Serviços"
)

cards_data = [
  {
    title_service: "Desenvolvimento Web",
    description_service: "Criação de aplicações web modernas, responsivas e otimizadas, utilizando as tecnologias mais avançadas do mercado.",
    icon_service: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="2" y="3" width="20" height="14" rx="2"/>
                            <path d="M8 21h8"/>
                            <path d="M12 17v4"/>
                        </svg>'
  },
  {
    title_service: "Desenvolvimento Mobile",
    description_service: "Apps nativos e híbridos para iOS e Android, com interface intuitiva e performance excepcional.",
    icon_service: ' <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="5" y="2" width="14" height="20" rx="2"/>
                            <path d="M12 18h.01"/>
                        </svg>'
  },
  {
    title_service: "Cyber Security",
    description_service: "Proteção avançada contra ameaças digitais, auditorias de segurança e implementação de políticas de segurança da informação.",
    icon_service: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                        </svg>'
  },
  {
    title_service: "Banco de Dados",
    description_service: "Modelagem, otimização e gerenciamento de bancos de dados relacionais e NoSQL para máxima performance.",
    icon_service: '
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <ellipse cx="12" cy="5" rx="9" ry="3"/>
                            <path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"/>
                            <path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"/>
                        </svg>'
  },
  {
    title_service: "Inovação Tecnológica",
    description_service: "Consultoria em novas tecnologias, transformação digital e adoção de soluções inovadoras para o seu negócio.",
    icon_service: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/>
                            <polyline points="7.5 4.21 12 6.81 16.5 4.21"/>
                            <polyline points="7.5 19.79 7.5 14.6 3 12"/>
                            <polyline points="21 12 16.5 14.6 16.5 19.79"/>
                            <polyline points="3.27 6.96 12 12.01 20.73 6.96"/>
                            <line x1="12" y1="22.08" x2="12" y2="12"/>
                        </svg>'
  },
  {
    title_service: "Suporte Técnico",
    description_service: "Atendimento especializado 24/7, manutenção preventiva e corretiva para garantir a continuidade do seu negócio.",
    icon_service: ' <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="12" r="10"/>
                            <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/>
                            <line x1="12" y1="17" x2="12.01" y2="17"/>
                        </svg>'
  },
  {
    title_service: "Performance e Escalabilidade",
    description_service: "Otimização de aplicações para suportar alto volume de acessos e crescimento sustentável.",
    icon_service: ' <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M4 15s1-1 4-1 5 2 8 2 4-1 4-1V3s-1 1-4 1-5-2-8-2-4 1-4 1z"/>
                            <line x1="4" y1="22" x2="4" y2="15"/>
                        </svg>'
  },
  {
    title_service: "Consultoria em TI",
    description_service: "Análise estratégica de infraestrutura tecnológica, planejamento e implementação de soluções alinhadas aos objetivos do negócio.",
    icon_service: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <rect x="3" y="5" width="18" height="14" rx="2"/>
  <path d="M8 13h8"/>
  <path d="M8 9h4"/>
  <polyline points="3,19 8,15"/>
</svg>'
  },
  {
    title_service: "Cloud Computing",
    description_service: "Soluções em nuvem para armazenamento, processamento e escalabilidade, garantindo flexibilidade e redução de custos.",
    icon_service: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <rect x="4" y="4" width="16" height="6" rx="2"/>
  <rect x="4" y="14" width="16" height="6" rx="2"/>
  <line x1="8" y1="8" x2="8" y2="8"/>
  <line x1="8" y1="18" x2="8" y2="18"/>
  <line x1="16" y1="8" x2="16" y2="8"/>
  <line x1="16" y1="18" x2="16" y2="18"/>
</svg>'
  },
  {
    title_service: "Metodologias Ágeis",
    description_service: "Desenvolvimento iterativo com Scrum e Kanban, entregas rápidas e adaptação constante às necessidades do cliente.",
    icon_service: ' <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="2" y="7" width="20" height="14" rx="2"/>
                            <path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"/>
                        </svg>'
  },
  {
    title_service: "Servidores Linux e Windows",
    description_service: "Configuração, gerenciamento e manutenção de infraestrutura de servidores em ambientes Linux e Windows.",
    icon_service: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <rect x="3" y="4" width="18" height="6" rx="2"/>
  <rect x="3" y="14" width="18" height="6" rx="2"/>
  <circle cx="7" cy="7" r="1"/>
  <circle cx="7" cy="17" r="1"/>
  <circle cx="17" cy="7" r="1"/>
  <circle cx="17" cy="17" r="1"/>
</svg>'
  },
  {
    title_service: "Monitoramento de APIs e Frontend",
    description_service: "Monitoramento em tempo real, detecção proativa de problemas e análise de performance de aplicações.",
    icon_service: '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <ellipse cx="12" cy="12" rx="9" ry="5"/>
  <circle cx="12" cy="12" r="2"/>
  <path d="M2 12a10 10 0 0 1 20 0"/>
</svg>'
  },
  {
    title_service: "Integração de Sistemas",
    description_service: "Conexão eficiente entre diferentes sistemas e plataformas para otimizar processos e fluxos de trabalho.",
    icon_service: ' <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <rect x="3" y="7" width="7" height="10" rx="2"/>
  <rect x="14" y="7" width="7" height="10" rx="2"/>
  <path d="M10 12h4"/>
</svg>'
  },
  {
    title_service: "Segurança da Informação",
    description_service: "Implementação de políticas, controles e tecnologias para proteger dados e garantir a confidencialidade, integridade e disponibilidade da informação.",
    icon_service: ' <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
  <rect x="6" y="10" width="12" height="8" rx="2"/>
  <path d="M9 10V7a3 3 0 0 1 6 0v3"/>
  <circle cx="12" cy="14" r="1"/>
</svg>'
  }
]


card_service.update!(cards: cards_data)

puts "Services seeded."

spinner = TTY::Spinner.new("[:spinner] Seeding database...", format: :pulse)
spinner.spin

puts "Seeding Tech Stack..."

card_tech = CardTech.find_or_create_by!(
  title: "NOSSA STACK",
  subtitle: "Tecnologias e Metodologias"
)

techs_data = [
  { name: "APIs REST", tech_description: "Desenvolvimento de APIs RESTful robustas, documentadas e versionadas, seguindo as melhores práticas de arquitetura e segurança." },
  { name: "Cloud Computing", tech_description: "Soluções em nuvem com AWS, Azure e Google Cloud, garantindo escalabilidade, disponibilidade e redução de custos." },
  { name: "DevOps", tech_description: "Automação de deploys, CI/CD, containerização com Docker e orquestração com Kubernetes para entregas contínuas." },
  { name: "Agile (Scrum, Kanban)", tech_description: "Gestão ágil de projetos com cerimônias Scrum, boards Kanban e comunicação transparente com stakeholders." },
  { name: "Segurança e Monitoramento", tech_description: "Implementação de firewalls, WAF, sistemas de detecção de intrusão e monitoramento 24/7 da infraestrutura." },
  { name: "Qualidade e Testes", tech_description: "Testes automatizados (unitários, integração, E2E), code review e análise de qualidade de código contínua." }
]

card_tech.update!(cards: techs_data)

puts "Tech Stack seeded."

spinner = TTY::Spinner.new("[:spinner] Seeding database...", format: :pulse)
spinner.spin

card_diffs = CardDiff.find_or_create_by!(
  title: "NOSSOS DIFERENCIAIS",
  subtitle: "Por que escolher a Sys Djam Soft House?"
)

differentials_data = [
  {
    number: "01",
    title: "Alta Performance",
    description: "Sistemas otimizados para carregamento rápido, baixa latência e excelente experiência do usuário."
  },
  {
    number: "02",
    title: "Escalabilidade",
    description: "Arquiteturas preparadas para crescer junto com seu negócio, suportando aumento de demanda sem perda de qualidade."
  },
  {
    number: "03",
    title: "Segurança Avançada",
    description: "Proteção multicamadas, criptografia end-to-end e conformidade com padrões internacionais de segurança."
  },
  {
    number: "04",
    title: "Atendimento Personalizado",
    description: "Equipe dedicada, comunicação transparente e suporte técnico disponível para atender suas necessidades específicas."
  },
  {
    number: "05",
    title: "Soluções Sob Medida",
    description: "Desenvolvemos projetos customizados que atendem perfeitamente aos requisitos e objetivos do seu negócio."
  }
]

card_diffs.update!(cards: differentials_data)
