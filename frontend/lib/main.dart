import 'package:flutter/material.dart';

void main() {
  runApp(const AdvocaciaApp());
}

class AdvocaciaApp extends StatelessWidget {
  const AdvocaciaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advocacia & Associados',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1A2332), // Navy
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A2332),
          secondary: const Color(0xFFD4AF37), // Gold
        ),
        fontFamily: 'Georgia',
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advocacia & Associados', 
          style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1A2332),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Hero Section
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 60 : 100, 
                    horizontal: 20
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const NetworkImage('https://images.unsplash.com/photo-1589829545856-d10d557cf95f?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        const Color(0xFF1A2332).withOpacity(0.9),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text('Excelência Jurídica',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: isMobile ? 26 : 32, 
                          fontWeight: FontWeight.bold
                        )
                      ),
                      const SizedBox(height: 10),
                      Text('Tradição & Inovação',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFD4AF37), 
                          fontSize: isMobile ? 20 : 24
                        )
                      ),
                      const SizedBox(height: 40),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: [
                          SizedBox(
                            width: isMobile ? constraints.maxWidth - 40 : null,
                            child: ElevatedButton(
                              onPressed: () => _showBookingDialog(context, 'Teleconsulta'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD4AF37),
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                shape: const StadiumBorder(),
                                elevation: 8,
                                shadowColor: Colors.black.withOpacity(0.5),
                              ),
                              child: const Text(
                                'AGENDE UMA TELECONSULTA',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: isMobile ? constraints.maxWidth - 40 : null,
                            child: ElevatedButton(
                              onPressed: () => _showBookingDialog(context, 'Consulta Presencial'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD4AF37),
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                shape: const StadiumBorder(),
                                elevation: 8,
                                shadowColor: Colors.black.withOpacity(0.5),
                              ),
                              child: const Text(
                                'AGENDE UMA CONSULTA PRESENCIAL',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Outras seções...
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text('Nossas Áreas de Atuação', 
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A2332))),
                  SizedBox(height: 20),
                  ListTile(
                    leading: Icon(Icons.business, color: Color(0xFFD4AF37)),
                    title: Text('Direito Empresarial'),
                  ),
                  ListTile(
                    leading: Icon(Icons.home, color: Color(0xFFD4AF37)),
                    title: Text('Direito Imobiliário'),
                  ),
                  ListTile(
                    leading: Icon(Icons.people, color: Color(0xFFD4AF37)),
                    title: Text('Direito de Família'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBookingDialog(BuildContext context, String tipo) {
    showDialog(
      context: context,
      builder: (context) => BookingDialog(tipo: tipo),
    );
  }
}

class BookingDialog extends StatefulWidget {
  final String tipo;
  const BookingDialog({super.key, required this.tipo});

  @override
  State<BookingDialog> createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  String? _metodoPagamento;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Agendar ${widget.tipo}', style: const TextStyle(color: Color(0xFF1A2332))),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Modalidade: ${widget.tipo}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFD4AF37))),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome Completo'),
                validator: (value) => value?.isEmpty ?? true ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Data Preferencial (DD/MM/AAAA)'),
                validator: (value) => value?.isEmpty ?? true ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 20),
              const Text('Forma de Pagamento:', style: TextStyle(fontWeight: FontWeight.bold)),
              RadioListTile<String>(
                title: const Text('PIX'),
                value: 'pix',
                groupValue: _metodoPagamento,
                onChanged: (v) => setState(() => _metodoPagamento = v),
              ),
              RadioListTile<String>(
                title: const Text('Cartão de Crédito'),
                value: 'credito',
                groupValue: _metodoPagamento,
                onChanged: (v) => setState(() => _metodoPagamento = v),
              ),
              RadioListTile<String>(
                title: const Text('Cartão de Débito'),
                value: 'debito',
                groupValue: _metodoPagamento,
                onChanged: (v) => setState(() => _metodoPagamento = v),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
        ElevatedButton(
          onPressed: _metodoPagamento == null ? null : () {
            if (_formKey.currentState?.validate() ?? false) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Agendamento realizado via ${_metodoPagamento!.toUpperCase()}!'))
              );
            }
          },
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37), foregroundColor: Colors.white),
          child: const Text('Confirmar e Pagar'),
        ),
      ],
    );
  }
}
