import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({super.key});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  int _selectedItemId = 0;
  final List<Map<String, dynamic>> _items = [
    {
      'id': 1,
      'title': 'Email de Jean',
      'subtitle': 'Réunion de projet - 09:30 AM',
      'content':
          'Bonjour, je vous confirme notre réunion de projet demain à 09h30. N\'oubliez pas d\'apporter les documents techniques.',
      'color': Colors.blue,
    },
    {
      'id': 2,
      'title': 'Message de Marie',
      'subtitle': 'Déjeuner d\'équipe - 12:00 PM',
      'content':
          'Salut ! On se retrouve à la cantine à midi pour le déjeuner d\'équipe ? J\'ai réservé une table pour 6 personnes.',
      'color': Colors.green,
    },
    {
      'id': 3,
      'title': 'Rapport Trimestriel',
      'subtitle': 'Finance - 03:15 PM',
      'content':
          'Le rapport trimestriel est prêt pour révision. Les chiffres montrent une croissance de 15% par rapport au trimestre dernier.',
      'color': Colors.orange,
    },
    {
      'id': 4,
      'title': 'Mise à jour Système',
      'subtitle': 'IT Department - 04:45 PM',
      'content':
          'Une mise à jour système est prévue ce soir à 20h00. Le système sera indisponible pendant environ 30 minutes.',
      'color': Colors.purple,
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedItemId = _items.first['id'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Responsive Multi-Pane'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Déterminer la disposition en fonction de la largeur d'écran
          if (constraints.maxWidth < 600) {
            // Mobile - Layout en une seule colonne
            return _buildMobileLayout();
          } else if (constraints.maxWidth < 900) {
            // Tablet - Layout avec navigation et contenu
            return _buildTabletLayout();
          } else {
            // Desktop - Layout multi-pane complet
            return _buildDesktopLayout();
          }
        },
      ),
    );
  }

  // Layout Mobile (une seule colonne)
  Widget _buildMobileLayout() {
    // Si un item est sélectionné, on affiche le détail en plein écran
    if (_selectedItemId > 0) {
      return _buildMobileDetailView();
    } else {
      // Sinon on affiche la liste
      return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return _buildListItem(item, true);
        },
      );
    }
  }

  // Vue de détail pour mobile (plein écran)
  Widget _buildMobileDetailView() {
    final selectedItem = _items.firstWhere(
      (item) => item['id'] == _selectedItemId,
      orElse: () => _items.first,
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              _selectedItemId = 0; // Retour à la liste
            });
          },
        ),
        title: Text(selectedItem['title']),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _buildDetailContent(selectedItem),
    );
  }

  // Layout Tablet (navigation + contenu côte à côte)
  Widget _buildTabletLayout() {
    return Row(
      children: [
        // Panneau de navigation (40% de la largeur)
        Container(
          width: 250,
          decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: Colors.grey)),
          ),
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final item = _items[index];
              return _buildListItem(item, false);
            },
          ),
        ),
        // Panneau de contenu (60% de la largeur)
        Expanded(child: _buildDetailPane()),
      ],
    );
  }

  // Layout Desktop (multi-pane complet)
  Widget _buildDesktopLayout() {
    return Row(
      children: [
        // Panneau de navigation (25% de la largeur)
        Container(
          width: 300,
          decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: Colors.grey)),
          ),
          child: Column(
            children: [
              // En-tête de navigation
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.inbox, color: Colors.blue),
                    SizedBox(width: 12),
                    Text(
                      'Boîte de réception',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Liste des éléments
              Expanded(
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return _buildListItem(item, false);
                  },
                ),
              ),
            ],
          ),
        ),
        // Panneau de détail (50% de la largeur)
        Expanded(flex: 2, child: _buildDetailPane()),
        // Panneau d'information (25% de la largeur)
        Container(
          width: 300,
          decoration: const BoxDecoration(
            border: Border(left: BorderSide(color: Colors.grey)),
          ),
          child: _buildInfoPane(),
        ),
      ],
    );
  }

  // Widget pour un élément de liste
  Widget _buildListItem(Map<String, dynamic> item, bool isMobile) {
    final bool isSelected = _selectedItemId == item['id'];

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade50 : Colors.transparent,
        border: isSelected
            ? Border(left: BorderSide(color: item['color'], width: 4))
            : null,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: item['color'].withOpacity(0.2),
          child: Icon(Icons.email, color: item['color']),
        ),
        title: Text(
          item['title'],
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        subtitle: Text(item['subtitle']),
        trailing: isMobile ? const Icon(Icons.chevron_right) : null,
        onTap: () {
          setState(() {
            _selectedItemId = item['id'];
          });
        },
      ),
    );
  }

  // Panneau de détail
  Widget _buildDetailPane() {
    final selectedItem = _items.firstWhere(
      (item) => item['id'] == _selectedItemId,
      orElse: () => _items.first,
    );

    return _buildDetailContent(selectedItem);
  }

  // Contenu du détail (réutilisable)
  Widget _buildDetailContent(Map<String, dynamic> selectedItem) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // En-tête du détail
          Row(
            children: [
              CircleAvatar(
                backgroundColor: selectedItem['color'].withOpacity(0.2),
                radius: 24,
                child: Icon(Icons.email, color: selectedItem['color']),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedItem['title'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      selectedItem['subtitle'],
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              IconButton(icon: const Icon(Icons.reply), onPressed: () {}),
              IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
            ],
          ),
          const SizedBox(height: 24),
          // Contenu
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Text(
                  selectedItem['content'],
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
            ),
          ),
          // Actions
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(onPressed: () {}, child: const Text('Répondre')),
              const SizedBox(width: 8),
              OutlinedButton(onPressed: () {}, child: const Text('Transférer')),
            ],
          ),
        ],
      ),
    );
  }

  // Panneau d'information (seulement sur desktop)
  Widget _buildInfoPane() {
    final selectedItem = _items.firstWhere(
      (item) => item['id'] == _selectedItemId,
      orElse: () => _items.first,
    );

    return Column(
      children: [
        // En-tête informations
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: const Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue),
              SizedBox(width: 12),
              Text(
                'Informations',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // Contenu informations
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoItem('De:', 'expediteur@example.com'),
              _buildInfoItem('À:', 'vous@example.com'),
              _buildInfoItem('Date:', 'Aujourd\'hui, 08:45'),
              _buildInfoItem('Sujet:', selectedItem['title']),
              const SizedBox(height: 16),
              const Text(
                'Tags',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  Chip(
                    label: const Text('Important'),
                    backgroundColor: Colors.orange.shade100,
                  ),
                  Chip(
                    label: const Text('Travail'),
                    backgroundColor: Colors.blue.shade100,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
