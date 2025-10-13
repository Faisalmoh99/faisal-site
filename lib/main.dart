/*
import 'package:flutter/material.dart';

// =========================================================
//  Faisal — AI/ML Engineer Portfolio (Flutter Single Page)
//  - No images, dark techy theme
//  - Top navbar anchors -> sections
//  - Skills as grouped chips (with highlights)
//  - Projects cards (code/demo buttons)
//  - No third-party packages
// =========================================================

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Faisal — AI/ML Engineer",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B1220),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF22D3EE), // cyan
          secondary: Color(0xFF7C3AED), // violet
          surface: Color(0xFF0B1220),
          onPrimary: Colors.black,
        ),
        textTheme: const TextTheme(
          displayMedium: TextStyle(fontSize: 42, fontWeight: FontWeight.w800, letterSpacing: -.2),
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white70),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.white70, height: 1.5),
        ),
        cardTheme: CardTheme(
          color: const Color(0xFF0F172A),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.zero,
        ),
      ),
      home: const _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  // Anchors
  final _scroll = ScrollController();
  final _heroKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  // TODO: personalize
  final String name = "Faisal";
  final String role = "AI/ML Engineer";
  final String city = "Jeddah / Riyadh";
  final String email = "add-your-email@example.com";
  final String github = "https://github.com/Faisalmoh99";
  final String linkedin = "https://www.linkedin.com/in/your-link/";

  // Projects links
  final _proj = const [
    _Project(
      title: "News Research (RAG)",
      brief: "URLs → extract → chunk → FAISS → answer (no API keys).",
      tech: ["LangChain", "FAISS", "Transformers", "Streamlit", "Python"],
      code: "https://github.com/Faisalmoh99/news-research-rag",
      demo: "",
    ),
    _Project(
      title: "Potato Disease Detector",
      brief: "MobileNetV2 + Streamlit with Top-3 probabilities.",
      tech: ["TensorFlow", "Keras", "PIL", "Streamlit"],
      code: "https://github.com/Faisalmoh99/potato-disease-detector",
      demo: "",
    ),
    _Project(
      title: "Movie Recommender (Hybrid)",
      brief: "TF-IDF content + Surprise SVD hybrid recommender.",
      tech: ["scikit-learn", "Surprise", "Pandas", "Streamlit"],
      code: "https://github.com/Faisalmoh99/movie-recommender-system",
      demo: "",
    ),
    _Project(
      title: "Lung Cancer Detection",
      brief: "ResNet18 transfer learning + class balancing (Streamlit demo).",
      tech: ["PyTorch", "torchvision", "sklearn", "Streamlit"],
      code: "https://github.com/Faisalmoh99/lung-cancer-detection",
      demo: "",
    ),
  ];

  Future<void> _goTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
      alignment: 0.08,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 980;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xCC0B1220),
            border: const Border(bottom: BorderSide(color: Color(0x221E293B))),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.25), blurRadius: 16, offset: const Offset(0, 6))
            ],
          ),
          child: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    _Logo(onTap: () => _goTo(_heroKey)),
                    const Spacer(),
                    if (isWide) ...[
                      _Nav(text: "Skills", onTap: () => _goTo(_skillsKey)),
                      _Nav(text: "Projects", onTap: () => _goTo(_projectsKey)),
                      _Nav(text: "Contact", onTap: () => _goTo(_contactKey)),
                      const SizedBox(width: 16),
                      _PrimaryBtn(label: "Hire Me", onTap: () => _launch("mailto:$email")),
                      const SizedBox(width: 10),
                      _GhostBtn(label: "GitHub", onTap: () => _launch(github)),
                      const SizedBox(width: 12),
                    ] else ...[
                      _GhostBtn(label: "Menu", onTap: () => _showDrawer()),
                      const SizedBox(width: 12),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: _DrawerNav(
        onSkills: () => _goTo(_skillsKey),
        onProjects: () => _goTo(_projectsKey),
        onContact: () => _goTo(_contactKey),
        onGitHub: () => _launch(github),
        onHire: () => _launch("mailto:$email"),
      ),
      body: SingleChildScrollView(
        controller: _scroll,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Section(
                  key: _heroKey,
                  child: _HeroHeader(
                    name: name,
                    role: role,
                    city: city,
                    email: email,
                    github: github,
                    linkedin: linkedin,
                  ),
                ),
                _Divider(),
                _Section(
                  key: _skillsKey,
                  title: "Skills",
                  child: _Skills(), // full widget below
                ),
                _Divider(),
                _Section(
                  key: _projectsKey,
                  title: "Featured Projects",
                  child: _ProjectsGrid(items: _proj),
                ),
                _Divider(),
                _Section(
                  key: _contactKey,
                  title: "Contact",
                  child: _Contact(email: email, github: github, linkedin: linkedin),
                ),
                const SizedBox(height: 48),
                const _Footer(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDrawer() => Scaffold.of(context).openDrawer();
}

// ========== Header ==================================================

class _HeroHeader extends StatelessWidget {
  final String name, role, city, email, github, linkedin;
  const _HeroHeader({
    required this.name,
    required this.role,
    required this.city,
    required this.email,
    required this.github,
    required this.linkedin,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 48, bottom: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi, I'm $name", style: t.displayMedium),
          const SizedBox(height: 8),
          ShaderMask(
            shaderCallback: (r) => const LinearGradient(
              colors: [Color(0xFF22D3EE), Color(0xFF7C3AED)],
            ).createShader(r),
            child: Text(role, style: t.headlineSmall!.copyWith(color: Colors.white)),
          ),
          const SizedBox(height: 10),
          Text(
            "I build practical AI systems (RAG, CV, Recommenders) with Python, PyTorch/TensorFlow, and Streamlit — ready to ship.",
            style: t.bodyMedium,
          ),
          const SizedBox(height: 10),
          Text("📍 $city", style: t.titleMedium),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _PrimaryBtn(label: "Hire Me", onTap: () => _launch("mailto:$email")),
              _GhostBtn(label: "GitHub", onTap: () => _launch(github)),
              _GhostBtn(label: "LinkedIn", onTap: () => _launch(linkedin)),
            ],
          ),
        ],
      ),
    );
  }
}

// ========== Skills ==================================================
// (highlight Flutter + Data stack)

class _Skills extends StatelessWidget {
  _Skills({super.key});

  final Set<String> highlight = const {
    "Flutter", "React/Next.js", "TypeScript",
    "Python", "Pandas", "SQL", "ETL/ELT", "Airflow", "Spark", "dbt"
  };

  final skills = const [
    _SkillGroupData(
      title: "AI/ML",
      items: [
        "LLMs","RAG","Prompt Engineering","PyTorch","TensorFlow","Transformers",
        "Fine-tuning (LoRA/PEFT)","Embeddings & Retrieval","Computer Vision","Time Series",
        "Anomaly Detection","Classification & Regression","Clustering & Dimensionality Reduction",
        "Reinforcement Learning",
      ],
    ),
    _SkillGroupData(
      title: "MLOps",
      items: [
        "MLflow","Weights & Biases","Feature Stores","Model Serving",
        "Evaluation & Guardrails","Monitoring & Telemetry",
      ],
    ),
    _SkillGroupData(
      title: "Data",
      items: [
        "Python","Pandas","SQL","ETL/ELT","Airflow","Spark","dbt",
        "Real-time pipelines","Data Visualization","Tableau","Power BI",
      ],
    ),
    _SkillGroupData(
      title: "Vector & Data Stores",
      items: ["Postgres","Redis","Elasticsearch","Pinecone","FAISS"],
    ),
    _SkillGroupData(
      title: "Dev & Ops",
      items: ["Docker","Linux","GitHub Actions","CI/CD","FastAPI/Flask","Kubernetes"],
    ),
    _SkillGroupData(
      title: "Audio & NLP",
      items: ["Whisper","librosa/torchaudio","Speech Enhancement","OCR","NLTK/spaCy"],
    ),
    _SkillGroupData(
      title: "Frontend",
      items: ["React/Next.js","TypeScript","Tailwind","Framer Motion","Flutter","HTML","CSS","JavaScript"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final isWide = c.maxWidth >= 1000;
        final columnCount = isWide ? 2 : 1;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(skills.length, (i) {
            final w = (c.maxWidth - 16 * (columnCount - 1)) / columnCount;
            return SizedBox(
              width: w,
              child: _SkillGroupCard(data: skills[i], highlight: highlight),
            );
          }),
        );
      },
    );
  }
}

class _SkillGroupData {
  final String title;
  final List<String> items;
  const _SkillGroupData({required this.title, required this.items});
}

class _SkillGroupCard extends StatelessWidget {
  final _SkillGroupData data;
  final Set<String> highlight;
  const _SkillGroupCard({super.key, required this.data, required this.highlight});

  @override
  Widget build(BuildContext context) {
    final border = Border.all(color: const Color(0x22374459));
    return Card(
      child: Container(
        decoration: BoxDecoration(border: border, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: data.items.map((txt) => _SkillChip(text: txt, highlight: highlight.contains(txt))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String text;
  final bool highlight;
  const _SkillChip({super.key, required this.text, this.highlight = false});

  @override
  Widget build(BuildContext context) {
    final bg = highlight ? const Color(0x3322D3EE) : const Color(0xFF111827);
    final border = highlight ? const Color(0x6622D3EE) : const Color(0x3322D3EE);
    final txt = highlight ? Colors.white : Colors.white.withOpacity(.9);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: border),
      ),
      child: Text(text, style: TextStyle(color: txt, fontSize: 13)),
    );
  }
}

// ========== Projects =================================================

class _Project {
  final String title, brief;
  final List<String> tech;
  final String code, demo;
  const _Project({required this.title, required this.brief, required this.tech, required this.code, required this.demo});
}

class _ProjectsGrid extends StatelessWidget {
  final List<_Project> items;
  const _ProjectsGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final columns = c.maxWidth >= 1050 ? 2 : 1;
      final w = (c.maxWidth - 16 * (columns - 1)) / columns;

      return Wrap(
        spacing: 16,
        runSpacing: 16,
        children: items
            .map((p) => SizedBox(width: w, child: _ProjectCard(p: p)))
            .toList(),
      );
    });
  }
}

class _ProjectCard extends StatefulWidget {
  final _Project p;
  const _ProjectCard({required this.p});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.p;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedScale( // ← بدّل AnimatedContainer + transform إلى AnimatedScale
        scale: _hover ? 1.01 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hover ? const Color(0x5522D3EE) : const Color(0x22374459),
            ),
            color: const Color(0xFF0F172A),
          ),
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(p.title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(p.brief, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: p.tech.map((t) => _SkillChip(text: t)).toList(),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                children: [
                  _PrimaryBtn(label: "Code", onTap: () => _launch(p.code)),
                  _GhostBtn(
                    label: p.demo.isEmpty ? "Demo (soon)" : "Demo",
                    onTap: () => _launch(p.demo),
                    disabled: p.demo.isEmpty,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// ========== Contact & Footer ========================================

class _Contact extends StatelessWidget {
  final String email, github, linkedin;
  const _Contact({required this.email, required this.github, required this.linkedin});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x22374459)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Wrap(
          spacing: 14,
          runSpacing: 14,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(Icons.mail_outline, size: 18, color: Colors.white70),
            _Link(text: email, onTap: () => _launch("mailto:$email")),
            const SizedBox(width: 16),
            const Icon(Icons.link, size: 18, color: Colors.white70),
            _Link(text: "GitHub", onTap: () => _launch(github)),
            _Dot(),
            _Link(text: "LinkedIn", onTap: () => _launch(linkedin)),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Text(
      "© ${DateTime.now().year} Faisal — Built with Flutter",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

// ========== Shared UI Components ====================================

class _Section extends StatelessWidget {
  final String? title;
  final Widget child;
  const _Section({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 32, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(title!, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
          ],
          child,
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(color: Color(0x22374459), thickness: 1),
    );
  }
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;
  const _Logo({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Row(
        children: const [
          Icon(Icons.smart_toy_outlined, color: Color(0xFF22D3EE)),
          SizedBox(width: 8),
          Text("Faisal", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
        ],
      ),
    );
  }
}

class _Nav extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _Nav({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(foregroundColor: Colors.white70, padding: const EdgeInsets.symmetric(horizontal: 14)),
      child: Text(text),
    );
  }
}

class _PrimaryBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool disabled;
  const _PrimaryBtn({required this.label, required this.onTap, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: disabled ? null : onTap,
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFF22D3EE),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label),
    );
  }
}

class _GhostBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool disabled;
  const _GhostBtn({required this.label, required this.onTap, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: disabled ? null : onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white70,
        side: const BorderSide(color: Color(0x3322D3EE)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label),
    );
  }
}

class _DrawerNav extends StatelessWidget {
  final VoidCallback onSkills, onProjects, onContact, onGitHub, onHire;
  const _DrawerNav({
    required this.onSkills,
    required this.onProjects,
    required this.onContact,
    required this.onGitHub,
    required this.onHire,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0B1220),
      child: SafeArea(
        child: ListView(
          children: [
            const ListTile(
              title: Text("Menu", style: TextStyle(fontWeight: FontWeight.w800)),
            ),
            const Divider(color: Color(0x22374459)),
            ListTile(title: const Text("Skills"), onTap: () { Navigator.pop(context); onSkills(); }),
            ListTile(title: const Text("Projects"), onTap: () { Navigator.pop(context); onProjects(); }),
            ListTile(title: const Text("Contact"), onTap: () { Navigator.pop(context); onContact(); }),
            const Divider(color: Color(0x22374459)),
            ListTile(title: const Text("GitHub"), onTap: () { Navigator.pop(context); onGitHub(); }),
            ListTile(title: const Text("Hire Me"), onTap: () { Navigator.pop(context); onHire(); }),
          ],
        ),
      ),
    );
  }
}

class _Link extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _Link({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF22D3EE),
          decoration: TextDecoration.underline,
          decorationColor: Color(0x5522D3EE),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 6, height: 6, decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle));
  }
}

// ========== Launch helper ===========================================
// (Works on web; on mobile/desktop you can use url_launcher package.
//  هنا نستخدم fallback بسيط للويب فقط.)
void _launch(String url) {
  // ignore: avoid_web_libraries_in_flutter
  // This is a no-op in non-web builds without url_launcher.
  // For production mobile builds, add url_launcher package.
}
*/


 /*
import 'package:flutter/material.dart';

// =========================================================
//  Faisal — AI/ML Engineer Portfolio (Flutter Single Page)
//  - No images, dark techy theme
//  - Top navbar anchors -> sections (About, Skills, Projects, Contact)
//  - Skills updated to YOUR list only (no MLOps)
//  - Projects cards (code/demo buttons)
//  - No third-party packages (launch() still placeholder)
// =========================================================

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Faisal — AI/ML Engineer",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B1220),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF22D3EE), // cyan
          secondary: Color(0xFF7C3AED), // violet
          surface: Color(0xFF0B1220),
          onPrimary: Colors.black,
        ),
        textTheme: const TextTheme(
          displayMedium: TextStyle(fontSize: 42, fontWeight: FontWeight.w800, letterSpacing: -.2),
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white70),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.white70, height: 1.5),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.white, height: 1.6),
        ),
        cardTheme: CardTheme(
          color: const Color(0xFF0F172A),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.zero,
        ),
      ),
      home: const _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  // Anchors
  final _scroll = ScrollController();
  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  // TODO: personalize
  final String name = "Faisal";
  final String role = "AI/ML Engineer";
  final String city = "Jeddah / Riyadh";
  final String email = "fisalfisal5050@gmail.com";
  final String github = "https://github.com/Faisalmoh99";
  final String linkedin = "https://www.linkedin.com/in/faisal-alhajjah";

  // Projects links
  final _proj = const [
    _Project(
      title: "News Research (RAG)",
      brief: "URLs → extract → chunk → FAISS → answer (no API keys).",
      tech: ["LangChain", "FAISS", "Transformers", "Streamlit", "Python"],
      code: "https://github.com/Faisalmoh99/news-research-rag",
      demo: "",
    ),
    _Project(
      title: "Potato Disease Detector",
      brief: "MobileNetV2 + Streamlit with Top-3 probabilities.",
      tech: ["TensorFlow", "Keras", "PIL", "Streamlit"],
      code: "https://github.com/Faisalmoh99/potato-disease-detector",
      demo: "",
    ),
    _Project(
      title: "Movie Recommender (Hybrid)",
      brief: "TF-IDF content + Surprise SVD hybrid recommender.",
      tech: ["scikit-learn", "Surprise", "Pandas", "Streamlit"],
      code: "https://github.com/Faisalmoh99/movie-recommender-system",
      demo: "",
    ),
    _Project(
      title: "Lung Cancer Detection",
      brief: "ResNet18 transfer learning + class balancing (Streamlit demo).",
      tech: ["PyTorch", "torchvision", "sklearn", "Streamlit"],
      code: "https://github.com/Faisalmoh99/lung-cancer-detection",
      demo: "",
    ),
  ];

  Future<void> _goTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
      alignment: 0.08,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 980;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xCC0B1220),
            border: const Border(bottom: BorderSide(color: Color(0x221E293B))),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(.25), blurRadius: 16, offset: const Offset(0, 6))],
          ),
          child: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    _Logo(onTap: () => _goTo(_heroKey)),
                    const Spacer(),
                    if (isWide) ...[
                      _Nav(text: "About", onTap: () => _goTo(_aboutKey)),
                      _Nav(text: "Skills", onTap: () => _goTo(_skillsKey)),
                      _Nav(text: "Projects", onTap: () => _goTo(_projectsKey)),
                      _Nav(text: "Contact", onTap: () => _goTo(_contactKey)),
                      const SizedBox(width: 16),
                      _PrimaryBtn(label: "Hire Me", onTap: () => _launch("mailto:$email")),
                      const SizedBox(width: 10),
                      _GhostBtn(label: "GitHub", onTap: () => _launch(github)),
                      const SizedBox(width: 12),
                    ] else ...[
                      _GhostBtn(label: "Menu", onTap: () => _showDrawer()),
                      const SizedBox(width: 12),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: _DrawerNav(
        onAbout: () => _goTo(_aboutKey),
        onSkills: () => _goTo(_skillsKey),
        onProjects: () => _goTo(_projectsKey),
        onContact: () => _goTo(_contactKey),
        onGitHub: () => _launch(github),
        onHire: () => _launch("mailto:$email"),
      ),
      body: SingleChildScrollView(
        controller: _scroll,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Section(
                  key: _heroKey,
                  child: _HeroHeader(
                    name: name,
                    role: role,
                    city: city,
                    email: email,
                    github: github,
                    linkedin: linkedin,
                  ),
                ),
                _Divider(),
                _Section(
                  key: _aboutKey,
                  title: "About",
                  child: const _About(),
                ),
                _Divider(),
                _Section(
                  key: _skillsKey,
                  title: "Skills",
                  child: _Skills(), // updated to your list
                ),
                _Divider(),
                _Section(
                  key: _projectsKey,
                  title: "Featured Projects",
                  child: _ProjectsGrid(items: _proj),
                ),
                _Divider(),
                _Section(
                  key: _contactKey,
                  title: "Contact",
                  child: _Contact(email: email, github: github, linkedin: linkedin),
                ),
                const SizedBox(height: 48),
                const _Footer(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDrawer() => Scaffold.of(context).openDrawer();
}

// ========== Header ==================================================

class _HeroHeader extends StatelessWidget {
  final String name, role, city, email, github, linkedin;
  const _HeroHeader({
    required this.name,
    required this.role,
    required this.city,
    required this.email,
    required this.github,
    required this.linkedin,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 48, bottom: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi, I'm $name", style: t.displayMedium),
          const SizedBox(height: 8),
          ShaderMask(
            shaderCallback: (r) => const LinearGradient(
              colors: [Color(0xFF22D3EE), Color(0xFF7C3AED)],
            ).createShader(r),
            child: Text(role, style: t.headlineSmall!.copyWith(color: Colors.white)),
          ),
          const SizedBox(height: 10),
          Text(
            "I build practical AI systems (RAG, CV, Recommenders) with Python, PyTorch/TensorFlow, and Streamlit — ready to ship.",
            style: t.bodyMedium,
          ),
          const SizedBox(height: 10),
          Text("📍 $city", style: t.titleMedium),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _PrimaryBtn(label: "Hire Me", onTap: () => _launch("mailto:$email")),
              _GhostBtn(label: "GitHub", onTap: () => _launch(github)),
              _GhostBtn(label: "LinkedIn", onTap: () => _launch(linkedin)),
            ],
          ),
        ],
      ),
    );
  }
}

// ========== About ===================================================

class _About extends StatelessWidget {
  const _About();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Text(
          "I’m an AI/ML engineer focused on shipping usable products: "
          "RAG that actually retrieves the right context, compact CV models that run fast, "
          "and recommenders with measurable impact. Comfortable across model training (PyTorch/TensorFlow), "
          "lightweight serving (Streamlit/FastAPI), and clean GitHub repos with docs/tests. "
          "Open to full-time roles in KSA.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

// ========== Skills ==================================================
// Updated EXACTLY to your list (no MLOps)

class _Skills extends StatelessWidget {
  _Skills({super.key});

  // إبراز تركيزك على Flutter/Data
  final Set<String> highlight = const {
    "Flutter", "Python", "Pandas", "SQL", "FAISS"
  };

  final skills = const [
    _SkillGroupData(
      title: "AI/ML",
      items: [
        "LLMs","RAG","Prompt Engineering","PyTorch","TensorFlow","Transformers",
        "Fine-tuning","Embeddings & Retrieval","Computer Vision",
        "Classification & Regression","Clustering","Reinforcement Learning",
      ],
    ),
    _SkillGroupData(
      title: "Data",
      items: ["Python","Pandas","SQL","Data Visualization","Tableau","Power BI"],
    ),
    _SkillGroupData(
      title: "Dev & Ops",
      items: ["Docker","Git","GitHub","FastAPI/Flask"],
    ),
    _SkillGroupData(
      title: "Frontend",
      items: ["Flutter","HTML","CSS","JavaScript"],
    ),
    _SkillGroupData(
      title: "Vector & Stores",
      items: ["FAISS"],
    ),
    _SkillGroupData(
      title: "Audio & NLP",
      items: ["NLTK/spaCy"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final isWide = c.maxWidth >= 1000;
        final columnCount = isWide ? 2 : 1;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(skills.length, (i) {
            final w = (c.maxWidth - 16 * (columnCount - 1)) / columnCount;
            return SizedBox(
              width: w,
              child: _SkillGroupCard(data: skills[i], highlight: highlight),
            );
          }),
        );
      },
    );
  }
}

class _SkillGroupData {
  final String title;
  final List<String> items;
  const _SkillGroupData({required this.title, required this.items});
}

class _SkillGroupCard extends StatelessWidget {
  final _SkillGroupData data;
  final Set<String> highlight;
  const _SkillGroupCard({super.key, required this.data, required this.highlight});

  @override
  Widget build(BuildContext context) {
    final border = Border.all(color: const Color(0x22374459));
    return Card(
      child: Container(
        decoration: BoxDecoration(border: border, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: data.items.map((txt) => _SkillChip(text: txt, highlight: highlight.contains(txt))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String text;
  final bool highlight;
  const _SkillChip({super.key, required this.text, this.highlight = false});

  @override
  Widget build(BuildContext context) {
    final bg = highlight ? const Color(0x3322D3EE) : const Color(0xFF111827);
    final border = highlight ? const Color(0x6622D3EE) : const Color(0x3322D3EE);
    final txt = highlight ? Colors.white : Colors.white.withOpacity(.9);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: border),
      ),
      child: Text(text, style: TextStyle(color: txt, fontSize: 13)),
    );
  }
}

// ========== Projects =================================================

class _Project {
  final String title, brief;
  final List<String> tech;
  final String code, demo;
  const _Project({required this.title, required this.brief, required this.tech, required this.code, required this.demo});
}

class _ProjectsGrid extends StatelessWidget {
  final List<_Project> items;
  const _ProjectsGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final columns = c.maxWidth >= 1050 ? 2 : 1;
      final w = (c.maxWidth - 16 * (columns - 1)) / columns;

      return Wrap(
        spacing: 16,
        runSpacing: 16,
        children: items.map((p) => SizedBox(width: w, child: _ProjectCard(p: p))).toList(),
      );
    });
  }
}

class _ProjectCard extends StatefulWidget {
  final _Project p;
  const _ProjectCard({required this.p});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.p;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedScale(
        scale: _hover ? 1.01 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _hover ? const Color(0x5522D3EE) : const Color(0x22374459)),
            color: const Color(0xFF0F172A),
          ),
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(p.title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(p.brief, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: p.tech.map((t) => _SkillChip(text: t)).toList(),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                children: [
                  _PrimaryBtn(label: "Code", onTap: () => _launch(p.code)),
                  _GhostBtn(
                    label: p.demo.isEmpty ? "Demo (soon)" : "Demo",
                    onTap: () => _launch(p.demo),
                    disabled: p.demo.isEmpty,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========== Contact & Footer ========================================

class _Contact extends StatelessWidget {
  final String email, github, linkedin;
  const _Contact({required this.email, required this.github, required this.linkedin});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x22374459)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Wrap(
          spacing: 14,
          runSpacing: 14,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(Icons.mail_outline, size: 18, color: Colors.white70),
            _Link(text: email, onTap: () => _launch("mailto:$email")),
            const SizedBox(width: 16),
            const Icon(Icons.link, size: 18, color: Colors.white70),
            _Link(text: "GitHub", onTap: () => _launch(github)),
            _Dot(),
            _Link(text: "LinkedIn", onTap: () => _launch(linkedin)),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Text(
      "© ${DateTime.now().year} Faisal — Built with Flutter",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

// ========== Shared UI Components ====================================

class _Section extends StatelessWidget {
  final String? title;
  final Widget child;
  const _Section({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 32, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(title!, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
          ],
          child,
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(color: Color(0x22374459), thickness: 1),
    );
  }
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;
  const _Logo({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Row(
        children: const [
          Icon(Icons.smart_toy_outlined, color: Color(0xFF22D3EE)),
          SizedBox(width: 8),
          Text("Faisal", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
        ],
      ),
    );
  }
}

class _Nav extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _Nav({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(foregroundColor: Colors.white70, padding: const EdgeInsets.symmetric(horizontal: 14)),
      child: Text(text),
    );
  }
}

class _PrimaryBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool disabled;
  const _PrimaryBtn({required this.label, required this.onTap, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: disabled ? null : onTap,
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFF22D3EE),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label),
    );
  }
}

class _GhostBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool disabled;
  const _GhostBtn({required this.label, required this.onTap, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: disabled ? null : onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white70,
        side: const BorderSide(color: Color(0x3322D3EE)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label),
    );
  }
}

class _DrawerNav extends StatelessWidget {
  final VoidCallback onAbout, onSkills, onProjects, onContact, onGitHub, onHire;
  const _DrawerNav({
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onContact,
    required this.onGitHub,
    required this.onHire,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0B1220),
      child: SafeArea(
        child: ListView(
          children: [
            const ListTile(title: Text("Menu", style: TextStyle(fontWeight: FontWeight.w800))),
            const Divider(color: Color(0x22374459)),
            ListTile(title: const Text("About"), onTap: () { Navigator.pop(context); onAbout(); }),
            ListTile(title: const Text("Skills"), onTap: () { Navigator.pop(context); onSkills(); }),
            ListTile(title: const Text("Projects"), onTap: () { Navigator.pop(context); onProjects(); }),
            ListTile(title: const Text("Contact"), onTap: () { Navigator.pop(context); onContact(); }),
            const Divider(color: Color(0x22374459)),
            ListTile(title: const Text("GitHub"), onTap: () { Navigator.pop(context); onGitHub(); }),
            ListTile(title: const Text("Hire Me"), onTap: () { Navigator.pop(context); onHire(); }),
          ],
        ),
      ),
    );
  }
}

class _Link extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _Link({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF22D3EE),
          decoration: TextDecoration.underline,
          decorationColor: Color(0x5522D3EE),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 6, height: 6, decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle));
  }
}

// ========== Launch helper ===========================================
// (Works as a placeholder. For real links on web/mobile,
//  add `url_launcher` later and call launchUrlString/ canLaunch.)
void _launch(String url) {
  // no-op to keep "no third-party packages" requirement as-is.
}
*/



import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

// =========================================================
//  Faisal — AI/ML Engineer Portfolio (Flutter Single Page)
//  - No images, dark techy theme
//  - Top navbar anchors -> sections (About, Skills, Projects, Contact)
//  - Skills updated to YOUR list only (no MLOps); FAISS merged into AI/ML
//  - Projects cards (code button; hide demo if empty)
//  - No third-party packages (launch() still placeholder)
// =========================================================

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Faisal — AI/ML Engineer",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B1220),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF22D3EE), // cyan
          secondary: Color(0xFF7C3AED), // violet
          surface: Color(0xFF0B1220),
          onPrimary: Colors.black,
        ),
        textTheme: const TextTheme(
          displayMedium: TextStyle(fontSize: 42, fontWeight: FontWeight.w800, letterSpacing: -.2),
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white70),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.white70, height: 1.5),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.white, height: 1.6),
        ),
        cardTheme: CardTheme(
          color: const Color(0xFF0F172A),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: EdgeInsets.zero,
        ),
      ),
      home: const _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  // Anchors
  final _scroll = ScrollController();
  final _heroKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  // بياناتك
  final String name = "Faisal";
  final String role = "AI/ML Engineer";
  final String city = "Jeddah / Riyadh";
  final String email = "fisalfisal5050@gmail.com";
  final String github = "https://github.com/Faisalmoh99";
  final String linkedin = "https://www.linkedin.com/in/faisal-alhajjah";

  // Projects
  final _proj = const [
    _Project(
      title: "News Research (RAG)",
      brief: "URLs → extract → chunk → FAISS → answer (no API keys).",
      tech: ["LangChain", "FAISS", "Transformers", "Streamlit", "Python"],
      code: "https://github.com/Faisalmoh99/news-research-rag",
      demo: "",
    ),
    _Project(
      title: "Potato Disease Detector",
      brief: "MobileNetV2 + Streamlit with Top-3 probabilities.",
      tech: ["TensorFlow", "Keras", "PIL", "Streamlit"],
      code: "https://github.com/Faisalmoh99/potato-disease-detector",
      demo: "",
    ),
    _Project(
      title: "Movie Recommender (Hybrid)",
      brief: "TF-IDF content + Surprise SVD hybrid recommender.",
      tech: ["scikit-learn", "Surprise", "Pandas", "Streamlit"],
      code: "https://github.com/Faisalmoh99/movie-recommender-system",
      demo: "",
    ),
    _Project(
      title: "Lung Cancer Detection",
      brief: "ResNet18 transfer learning + class balancing (Streamlit demo).",
      tech: ["PyTorch", "torchvision", "sklearn", "Streamlit"],
      code: "https://github.com/Faisalmoh99/lung-cancer-detection",
      demo: "",
    ),
  ];

  Future<void> _goTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
      alignment: 0.08,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 980;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xCC0B1220),
            border: const Border(bottom: BorderSide(color: Color(0x221E293B))),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(.25), blurRadius: 16, offset: const Offset(0, 6))],
          ),
          child: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    _Logo(onTap: () => _goTo(_heroKey)),
                    const Spacer(),
                    if (isWide) ...[
                      _Nav(text: "About", onTap: () => _goTo(_aboutKey)),
                      _Nav(text: "Skills", onTap: () => _goTo(_skillsKey)),
                      _Nav(text: "Projects", onTap: () => _goTo(_projectsKey)),
                      _Nav(text: "Contact", onTap: () => _goTo(_contactKey)),
                      const SizedBox(width: 16),
                      _PrimaryBtn(label: "Hire Me", onTap: () => _launch("mailto:$email")),
                      const SizedBox(width: 10),
                      _GhostBtn(label: "GitHub", onTap: () => _launch(github)),
                      const SizedBox(width: 12),
                    ] else ...[
                      _GhostBtn(label: "Menu", onTap: () => _showDrawer()),
                      const SizedBox(width: 12),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      drawer: _DrawerNav(
        onAbout: () => _goTo(_aboutKey),
        onSkills: () => _goTo(_skillsKey),
        onProjects: () => _goTo(_projectsKey),
        onContact: () => _goTo(_contactKey),
        onGitHub: () => _launch(github),
        onHire: () => _launch("mailto:$email"),
      ),
      body: SingleChildScrollView(
        controller: _scroll,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Section(
                  key: _heroKey,
                  child: _HeroHeader(
                    name: name,
                    role: role,
                    city: city,
                    email: email,
                    github: github,
                    linkedin: linkedin,
                  ),
                ),
                _Divider(),
                _Section(
                  key: _aboutKey,
                  title: "About",
                  child: const _About(),
                ),
                _Divider(),
                _Section(
                  key: _skillsKey,
                  title: "Skills",
                  child: _Skills(), // updated to your list
                ),
                _Divider(),
                _Section(
                  key: _projectsKey,
                  title: "Featured Projects",
                  child: _ProjectsGrid(items: _proj),
                ),
                _Divider(),
                _Section(
                  key: _contactKey,
                  title: "Contact",
                  child: _Contact(email: email, github: github, linkedin: linkedin),
                ),
                const SizedBox(height: 48),
                const _Footer(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDrawer() => Scaffold.of(context).openDrawer();
}

// ========== Header ==================================================

class _HeroHeader extends StatelessWidget {
  final String name, role, city, email, github, linkedin;
  const _HeroHeader({
    required this.name,
    required this.role,
    required this.city,
    required this.email,
    required this.github,
    required this.linkedin,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 48, bottom: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi, I'm $name", style: t.displayMedium),
          const SizedBox(height: 8),
          ShaderMask(
            shaderCallback: (r) => const LinearGradient(
              colors: [Color(0xFF22D3EE), Color(0xFF7C3AED)],
            ).createShader(r),
            child: Text(role, style: t.headlineSmall!.copyWith(color: Colors.white)),
          ),
          const SizedBox(height: 10),
          // ✅ استبدال سطر الهيرو بالنص المخصص
          Text(
            "AI graduate (B.Sc.) from Jeddah International College with GPA 4.3/5, "
            "skilled in building end-to-end ML solutions (Python, TensorFlow, scikit-learn) "
            "and shipping practical applications (Flask APIs, Firebase, Flutter) across CV and NLP. "
            "Seeking an entry-level role to contribute and grow within a high-impact team.",
            style: t.bodyMedium,
          ),
          const SizedBox(height: 10),
          Text("📍 $city", style: t.titleMedium),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _PrimaryBtn(label: "Hire Me", onTap: () => _launch("mailto:$email")),
              _GhostBtn(label: "GitHub", onTap: () => _launch(github)),
              _GhostBtn(label: "LinkedIn", onTap: () => _launch(linkedin)),
            ],
          ),
        ],
      ),
    );
  }
}

// ========== About ===================================================

class _About extends StatelessWidget {
  const _About();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Text(
          // ✅ استبدال فقرة About بالنص المخصص
          "AI graduate (B.Sc.) from Jeddah International College with GPA 4.3/5, "
          "skilled in building end-to-end ML solutions (Python, TensorFlow, scikit-learn) "
          "and shipping practical applications (Flask APIs, Firebase, Flutter) across computer vision and NLP. "
          "Seeking an entry-level role where I can contribute effectively and grow within a high-impact team.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

// ========== Skills ==================================================
// Updated EXACTLY to your list (no MLOps), FAISS merged into AI/ML

class _Skills extends StatelessWidget {
  _Skills({super.key});

  final Set<String> highlight = const {
    "Flutter", "Python", "Pandas", "SQL", "FAISS"
  };

  final skills = const [
    _SkillGroupData(
      title: "AI/ML",
      items: [
        "LLMs","RAG","Prompt Engineering","PyTorch","TensorFlow","Transformers",
        "Fine-tuning","Embeddings & Retrieval","FAISS","Computer Vision",
        "Classification & Regression","Clustering","Reinforcement Learning" , "NLTK/spaCy",
      ],
    ),
    _SkillGroupData(
      title: "Data",
      items: ["Python","Pandas","SQL","Data Visualization","Tableau","Power BI"],
    ),
    _SkillGroupData(
      title: "Dev & Ops",
      items: ["Docker","Git","GitHub","FastAPI/Flask"],
    ),
    _SkillGroupData(
      title: "Frontend",
      items: ["Flutter","HTML","CSS","JavaScript"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final isWide = c.maxWidth >= 1000;
        final columnCount = isWide ? 2 : 1;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(skills.length, (i) {
            final w = (c.maxWidth - 16 * (columnCount - 1)) / columnCount;
            return SizedBox(
              width: w,
              child: _SkillGroupCard(data: skills[i], highlight: highlight),
            );
          }),
        );
      },
    );
  }
}

class _SkillGroupData {
  final String title;
  final List<String> items;
  const _SkillGroupData({required this.title, required this.items});
}

class _SkillGroupCard extends StatelessWidget {
  final _SkillGroupData data;
  final Set<String> highlight;
  const _SkillGroupCard({super.key, required this.data, required this.highlight});

  @override
  Widget build(BuildContext context) {
    final border = Border.all(color: const Color(0x22374459));
    return Card(
      child: Container(
        decoration: BoxDecoration(border: border, borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: data.items.map((txt) => _SkillChip(text: txt, highlight: highlight.contains(txt))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String text;
  final bool highlight;
  const _SkillChip({super.key, required this.text, this.highlight = false});

  @override
  Widget build(BuildContext context) {
    final bg = highlight ? const Color(0x3322D3EE) : const Color(0xFF111827);
    final border = highlight ? const Color(0x6622D3EE) : const Color(0x3322D3EE);
    final txt = highlight ? Colors.white : Colors.white.withOpacity(.9);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: border),
      ),
      child: Text(text, style: TextStyle(color: txt, fontSize: 13)),
    );
  }
}

// ========== Projects =================================================

class _Project {
  final String title, brief;
  final List<String> tech;
  final String code, demo;
  const _Project({required this.title, required this.brief, required this.tech, required this.code, required this.demo});
}

class _ProjectsGrid extends StatelessWidget {
  final List<_Project> items;
  const _ProjectsGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final columns = c.maxWidth >= 1050 ? 2 : 1;
      final w = (c.maxWidth - 16 * (columns - 1)) / columns;

      return Wrap(
        spacing: 16,
        runSpacing: 16,
        children: items.map((p) => SizedBox(width: w, child: _ProjectCard(p: p))).toList(),
      );
    });
  }
}

class _ProjectCard extends StatefulWidget {
  final _Project p;
  const _ProjectCard({required this.p});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.p;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedScale(
        scale: _hover ? 1.01 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _hover ? const Color(0x5522D3EE) : const Color(0x22374459)),
            color: const Color(0xFF0F172A),
          ),
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(p.title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(p.brief, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: p.tech.map((t) => _SkillChip(text: t)).toList(),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                children: [
                  _PrimaryBtn(label: "Code", onTap: () => _launch(p.code)),
                  // ✅ لا نعرض زر الديمو إذا ما في رابط
                  if (p.demo.isNotEmpty)
                    _GhostBtn(label: "Demo", onTap: () => _launch(p.demo)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ========== Contact & Footer ========================================

class _Contact extends StatelessWidget {
  final String email, github, linkedin;
  const _Contact({required this.email, required this.github, required this.linkedin});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0x22374459)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Wrap(
          spacing: 14,
          runSpacing: 14,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(Icons.mail_outline, size: 18, color: Colors.white70),
            _Link(text: email, onTap: () => _launch("mailto:$email")),
            const SizedBox(width: 16),
            const Icon(Icons.link, size: 18, color: Colors.white70),
            _Link(text: "GitHub", onTap: () => _launch(github)),
            _Dot(),
            _Link(text: "LinkedIn", onTap: () => _launch(linkedin)),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Text(
      "© ${DateTime.now().year} Faisal — Built with Flutter",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}

// ========== Shared UI Components ====================================

class _Section extends StatelessWidget {
  final String? title;
  final Widget child;
  const _Section({super.key, this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 32, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(title!, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
          ],
          child,
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(color: Color(0x22374459), thickness: 1),
    );
  }
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;
  const _Logo({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Row(
        children: const [
          Icon(Icons.smart_toy_outlined, color: Color(0xFF22D3EE)),
          SizedBox(width: 8),
          Text("Faisal", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
        ],
      ),
    );
  }
}

class _Nav extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _Nav({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(foregroundColor: Colors.white70, padding: const EdgeInsets.symmetric(horizontal: 14)),
      child: Text(text),
    );
  }
}

class _PrimaryBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool disabled;
  const _PrimaryBtn({required this.label, required this.onTap, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: disabled ? null : onTap,
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFF22D3EE),
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label),
    );
  }
}

class _GhostBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool disabled;
  const _GhostBtn({required this.label, required this.onTap, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: disabled ? null : onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white70,
        side: const BorderSide(color: Color(0x3322D3EE)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(label),
    );
  }
}

class _DrawerNav extends StatelessWidget {
  final VoidCallback onAbout, onSkills, onProjects, onContact, onGitHub, onHire;
  const _DrawerNav({
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onContact,
    required this.onGitHub,
    required this.onHire,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0B1220),
      child: SafeArea(
        child: ListView(
          children: [
            const ListTile(title: Text("Menu", style: TextStyle(fontWeight: FontWeight.w800))),
            const Divider(color: Color(0x22374459)),
            ListTile(title: const Text("About"), onTap: () { Navigator.pop(context); onAbout(); }),
            ListTile(title: const Text("Skills"), onTap: () { Navigator.pop(context); onSkills(); }),
            ListTile(title: const Text("Projects"), onTap: () { Navigator.pop(context); onProjects(); }),
            ListTile(title: const Text("Contact"), onTap: () { Navigator.pop(context); onContact(); }),
            const Divider(color: Color(0x22374459)),
            ListTile(title: const Text("GitHub"), onTap: () { Navigator.pop(context); onGitHub(); }),
            ListTile(title: const Text("Hire Me"), onTap: () { Navigator.pop(context); onHire(); }),
          ],
        ),
      ),
    );
  }
}

class _Link extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _Link({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF22D3EE),
          decoration: TextDecoration.underline,
          decorationColor: Color(0x5522D3EE),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 6, height: 6, decoration: const BoxDecoration(color: Colors.white24, shape: BoxShape.circle));
  }
}

// ========== Launch helper ===========================================
// Placeholder only. For real links on web/mobile, add `url_launcher`.
Future<void> _launch(String url) async {
  final ok = await launchUrlString(
    url,
    mode: LaunchMode.externalApplication, // يفتح في تطبيق/لسان خارجي
  );
  if (!ok) {
    // اختياري: اطبع أو أظهر رسالة فشل
    // debugPrint('Could not launch $url');
  }
}

