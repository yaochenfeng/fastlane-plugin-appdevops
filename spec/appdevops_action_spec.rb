describe Fastlane::Actions::AppdevopsAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The appdevops plugin is working!")

      Fastlane::Actions::AppdevopsAction.run(nil)
    end
  end
end
