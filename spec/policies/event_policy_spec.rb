require 'rails_helper'

RSpec.describe EventPolicy do
  subject { described_class }

  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: user) }

  context 'When the user is authenticated and is the event creator' do
    permissions :show?, :edit?, :update?, :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end

  context 'When the user is authentificated but not the event creator' do
    permissions :show? do
      it { is_expected.to permit(user, event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(other_user, event) }
    end
  end

  context 'When the user is not authentificated' do
    permissions :show? do
      it { is_expected.to permit(nil, event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end
  end
end
