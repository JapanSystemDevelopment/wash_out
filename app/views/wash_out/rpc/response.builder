xml.instruct!
xml.tag! 'env:Envelope',
         'xmlns:xsd': 'http://www.w3.org/2001/XMLSchema',
         'xmlns:xsi': 'http://www.w3.org/2001/XMLSchema-instance',
         'xmlns:env': 'http://schemas.xmlsoap.org/soap/envelope/' do

  if !header.nil?
    xml.tag! 'env:Header' do
      xml.tag! "n1:#{@action_spec[:response_tag]}" do
        wsdl_data xml, header
      end
    end
  end

  xml.tag! 'env:Body' do
    xml.tag! "n1:#{@action_spec[:response_tag]}",
             'xmlns:n1': @namespace,
             'env:encodingStyle': 'http://schemas.xmlsoap.org/soap/encoding/' do
      wsdl_data xml, result
    end
  end
end
