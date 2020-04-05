require "web_helper"

RSpec.describe Dfd::Web::Views::Root::Index do
  subject(:view) { described_class.new(template, exposures) }
  let(:exposures) { { current_user: current_user } }
  let(:template)  { Hanami::View::Template.new('lib/dfd/web/templates/root/index.html.erb') }
  let(:current_user) { nil }

  describe '#render' do
    subject(:rendered) { view.render }

    it 'shows a link to google auth' do
      expect(rendered).to match(%(<a href="/auth/google_oauth2"))
    end

    context 'when the user is logged in' do
      let(:current_user) { double('user', name: 'jon', email: 'a@b.c') }

      it 'shows a link to google auth' do
        expect(rendered).to match(%(<a href="/auth/signout"))
      end
    end
  end
end
