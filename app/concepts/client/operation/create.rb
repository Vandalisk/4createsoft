class Client::Create < Trailblazer::Operation
  step Model( Client, :new )
  step Contract::Build(constant: Client::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()
end
