# Site Escritório de Advocacia - Ecossistema Digital

Este projeto visa transformar a presença digital de um escritório de advocacia em um ecossistema completo, unindo site, aplicativo móvel e uma API robusta.

## 🎯 Visão e Objetivos
1. **Multiplataforma**: Transformar o projeto em uma API, um site e um aplicativo móvel.
2. **Tecnologia de Ponta**: Uso do ecossistema **Dart & Flutter** para lançamento unificado na Play Store (Android) e Apple Store (iOS).
3. **Teleconsulta**: Implementar funcionalidade de agendamento e realização de teleconsultas diretamente pela plataforma.
4. **Sistema de Pagamentos**: Integração de pagamentos via **PIX, Débito e Crédito** para as consultas.
5. **Agendamento Inteligente**: Sistema para que as consultas possam ser agendadas de forma síncrona.

---

## ✅ O Que Já Foi Feito
- [x] **Arquitetura Monorepo**: Organização do projeto em pastas `backend` (API Dart/Shelf) e `frontend` (App/Web Flutter).
- [x] **API Base**: Implementação de rotas para agendamento e processamento de pagamentos.
- [x] **Frontend Flutter**: Criação do aplicativo com suporte para Web e Mobile.
- [x] **Layout Premium**: Design sofisticado em Navy & Gold, totalmente responsivo para celulares.
- [x] **Funcionalidades de Consulta**:
    - [x] Botões destacados para "Agendar Teleconsulta" e "Agendar Consulta Presencial".
    - [x] Diálogo de agendamento com seleção de modalidade e forma de pagamento.
- [x] **Correções Visuais**: Padronização de botões (estilo cápsula) e correção de imagens da equipe.
- [x] **Ajuste de Responsividade**: Ajuste fino de responsividade e posicionamento do menu mobile.

---

## 🚀 Próximos Passos (Para Produção e Venda)

### 1. Backend & Segurança
- **Banco de Dados**: Integrar um banco de dados real (PostgreSQL ou Firebase) para persistir os agendamentos.
- **Autenticação**: Implementar login para clientes e advogados (JWT ou Firebase Auth).
- **Segurança**: Configurar HTTPS e proteção de rotas sensíveis.

### 2. Pagamentos Reais
- **Gateway de Pagamento**: Integrar com APIs reais (Stripe, Mercado Pago ou Juno) para processar PIX e Cartões de verdade.
- **Webhooks**: Configurar notificações automáticas de confirmação de pagamento.

### 3. Experiência de Teleconsulta
- **Videochamada**: Integrar um provedor de vídeo (Agora.io ou Jitsi) para realizar a chamada dentro do app/site.
- **Notificações**: Implementar notificações Push para lembrar o cliente do horário da consulta.

### 4. Lançamento e Infraestrutura
- **Hospedagem API**: Deploy do backend em serviços como Google Cloud, AWS ou DigitalOcean.
- **Domínio Profissional**: Configuração de domínio `.com.br` com e-mails corporativos.
- **Publicação**: Preparar assets (ícones, prints) e submeter o app para análise na Play Store e App Store.

---

## 🛠️ Como Rodar
- **Web**: `python -m http.server 8000` (na raiz) para a versão HTML estática.
- **API**: `dart run backend/bin/server.dart`
- **App/Web Flutter**: `flutter run -d chrome` (dentro da pasta frontend)
