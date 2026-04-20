import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as io;

class AdvocaciaApi {
  Handler get handler {
    final router = Router();

    // Rota base
    router.get('/', (Request request) {
      return Response.ok(jsonEncode({'message': 'API Advocacia & Associados Online'}),
          headers: {'content-type': 'application/json'});
    });

    // Rota para agendamento de teleconsulta
    router.post('/agendar', (Request request) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload);
      
      // Simulação de salvamento no banco de dados
      print('Novo agendamento recebido: $data');
      
      return Response.ok(jsonEncode({
        'status': 'success',
        'message': 'Teleconsulta agendada com sucesso!',
        'id': 'TC-${DateTime.now().millisecondsSinceEpoch}'
      }), headers: {'content-type': 'application/json'});
    });

    // Rota para processamento de pagamento
    router.post('/pagamento', (Request request) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload);
      final metodo = data['metodo']; // pix, credito, debito
      
      print('Processando pagamento via $metodo');
      
      return Response.ok(jsonEncode({
        'status': 'success',
        'message': 'Pagamento processado via ${metodo.toUpperCase()}',
        'transactionId': 'TX-${DateTime.now().millisecondsSinceEpoch}'
      }), headers: {'content-type': 'application/json'});
    });

    return router;
  }
}

void main() async {
  final api = AdvocaciaApi();
  final server = await io.serve(api.handler, '0.0.0.0', 8080);
  print('Servidor API rodando em http://${server.address.host}:${server.port}');
}
