module ApplicationHelper
    def payload_test
        JSON.parse(response.body, symbolize_names: true) # convertir la respuesta del servidor a un objeto JSON para poder evaluar durante las pruebas
    end
end