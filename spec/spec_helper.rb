require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'clef'

Spec::Runner.configure do |config|

  config.before(:each) do
    midi = mock(MIDIator::Interface,
                :control_change => nil,
                :program_change => nil,
                :note_on        => nil,
                :note_off       => nil,
                :autodetect_driver => nil)
    MIDIator::Interface.stub!(:new).and_return(midi)
  end
  
end
