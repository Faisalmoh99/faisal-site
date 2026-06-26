/*
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

// =========================================================
//  Faisal Alhajah — AI Engineer & Founder Portfolio
//  Premium Dark Theme with Glassmorphism
// =========================================================

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Faisal Alhajah — AI Engineer",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0a0a0f),
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00D4FF),
          secondary: Color(0xFF7C3AED),
          surface: Color(0xFF0a0a0f),
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
  final _scroll = ScrollController();
  final _heroKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  // Personal Info
  final String name = "Faisal Alhajah";
  final String role = "AI Engineer & Founder";
  final String email = "faisal.alhajjah@gmail.com";
  final String github = "https://github.com/Faisalmoh99";
  final String linkedin = "https://www.linkedin.com/in/faisal-alhajjah";
  final String location = "Saudi Arabia";

  Future<void> _goTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(ctx, duration: const Duration(milliseconds: 600), curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(isWide),
      drawer: isWide ? null : _buildDrawer(),
      body: Stack(
        children: [
          // Animated Background
          _AnimatedBackground(),
          // Content
          SingleChildScrollView(
            controller: _scroll,
            child: Column(
              children: [
                _HeroSection(key: _heroKey, name: name, role: role, email: email, github: github, linkedin: linkedin),
                _AboutSection(key: _aboutKey),
                _SkillsSection(key: _skillsKey),
                _ProjectsSection(key: _projectsKey),
                _ContactSection(key: _contactKey, email: email, github: github, linkedin: linkedin, location: location),
                const SizedBox(height: 40),
                _Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(bool isWide) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFF0a0a0f).withOpacity(0.9), const Color(0xFF0a0a0f).withOpacity(0)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                // Logo
                GestureDetector(
                  onTap: () => _goTo(_heroKey),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF7C3AED)]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text("F", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white)),
                      ),
                      const SizedBox(width: 12),
                      const Text("Faisal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                const Spacer(),
                if (isWide) ...[
                  _NavItem(text: "Experience", onTap: () => _goTo(_experienceKey)),
                  _NavItem(text: "About", onTap: () => _goTo(_aboutKey)),
                  _NavItem(text: "Skills", onTap: () => _goTo(_skillsKey)),
                  _NavItem(text: "Projects", onTap: () => _goTo(_projectsKey)),
                  _NavItem(text: "Contact", onTap: () => _goTo(_contactKey)),
                  const SizedBox(width: 20),
                  _GradientButton(label: "Let's Talk", onTap: () => _launch("mailto:$email")),
                ] else
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF0a0a0f),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Menu", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              const SizedBox(height: 32),
              _DrawerItem(text: "Experience", onTap: () { Navigator.pop(context); _goTo(_experienceKey); }),
              _DrawerItem(text: "About", onTap: () { Navigator.pop(context); _goTo(_aboutKey); }),
              _DrawerItem(text: "Skills", onTap: () { Navigator.pop(context); _goTo(_skillsKey); }),
              _DrawerItem(text: "Projects", onTap: () { Navigator.pop(context); _goTo(_projectsKey); }),
              _DrawerItem(text: "Contact", onTap: () { Navigator.pop(context); _goTo(_contactKey); }),
              const Spacer(),
              _GradientButton(label: "Let's Talk", onTap: () => _launch("mailto:$email")),
            ],
          ),
        ),
      ),
    );
  }
}

// ========== ANIMATED BACKGROUND ==========
class _AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient orbs
        Positioned(top: -100, right: -100, child: _GlowOrb(color: const Color(0xFF00D4FF), size: 400)),
        Positioned(top: 400, left: -150, child: _GlowOrb(color: const Color(0xFF7C3AED), size: 350)),
        Positioned(bottom: 200, right: -100, child: _GlowOrb(color: const Color(0xFF00D4FF), size: 300)),
        // Grid overlay
        Positioned.fill(
          child: CustomPaint(painter: _GridPainter()),
        ),
      ],
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final Color color;
  final double size;
  const _GlowOrb({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color.withOpacity(0.3), color.withOpacity(0.1), color.withOpacity(0)],
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.03)
      ..strokeWidth = 1;
    const spacing = 60.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ========== HERO SECTION ==========
class _HeroSection extends StatelessWidget {
  final String name, role, email, github, linkedin;
  const _HeroSection({super.key, required this.name, required this.role, required this.email, required this.github, required this.linkedin});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;
    
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: EdgeInsets.fromLTRB(24, isWide ? 180 : 140, 24, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF00D4FF).withOpacity(0.5)),
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFF00D4FF).withOpacity(0.1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFF00FF88), shape: BoxShape.circle)),
                const SizedBox(width: 10),
                const Text("Available for Full-time & Contract roles", style: TextStyle(color: Color(0xFF00D4FF), fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Name with gradient
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(colors: [Colors.white, Color(0xFFa0a0a0)]).createShader(bounds),
            child: Text(name, style: TextStyle(fontSize: isWide ? 72 : 48, fontWeight: FontWeight.w800, color: Colors.white, height: 1.1)),
          ),
          const SizedBox(height: 16),
          // Role with gradient
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF7C3AED)]).createShader(bounds),
            child: Text(role, style: TextStyle(fontSize: isWide ? 32 : 24, fontWeight: FontWeight.w700, color: Colors.white)),
          ),
          const SizedBox(height: 24),
          // Tagline
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Text(
              "I build AI systems that actually work in production — from autonomous agents that replace manual tasks to ML-powered apps serving real users.",
              style: TextStyle(fontSize: isWide ? 20 : 17, color: Colors.white70, height: 1.6),
            ),
          ),
          const SizedBox(height: 40),
          // CTA Buttons
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _GradientButton(label: "View My Work", onTap: () {}, icon: Icons.arrow_forward),
              _OutlineButton(label: "Download CV", onTap: () {}),
            ],
          ),
          const SizedBox(height: 48),
          // Stats
          Wrap(
            spacing: 48,
            runSpacing: 24,
            children: [
              _StatItem(number: "2+", label: "Years Building AI"),
              _StatItem(number: "7+", label: "Shipped Projects"),
              _StatItem(number: "3+", label: "AI Agents Built"),
            ],
          ),
        ],
      ),
    );
  }
}

// ========== ABOUT SECTION ==========
class _AboutSection extends StatelessWidget {
  const _AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _SectionHeader(title: "About Me", subtitle: "WHO I AM"),
              const SizedBox(height: 60),
              isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _AboutContent()),
                        const SizedBox(width: 60),
                        Expanded(child: _AboutHighlights()),
                      ],
                    )
                  : Column(
                      children: [
                        _AboutContent(),
                        const SizedBox(height: 40),
                        _AboutHighlights(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 18, color: Colors.white70, height: 1.8),
            children: [
              const TextSpan(text: "I'm not your typical AI graduate. While others build "),
              TextSpan(text: "tutorial projects", style: TextStyle(color: Colors.white.withOpacity(0.5), decoration: TextDecoration.lineThrough)),
              const TextSpan(text: ", I build "),
              const TextSpan(text: "production systems", style: TextStyle(color: Color(0xFF00D4FF), fontWeight: FontWeight.w600)),
              const TextSpan(text: " that solve real problems.\n\n"),
              const TextSpan(text: "As the "),
              const TextSpan(text: "Founder of Makn", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              const TextSpan(text: ", I built an "),
              const TextSpan(text: "autonomous AI agent", style: TextStyle(color: Color(0xFF7C3AED), fontWeight: FontWeight.w600)),
              const TextSpan(text: " designed to handle clinic bookings end-to-end — scheduling, cancellations, conflict detection, and WhatsApp reminders. "),
              const TextSpan(text: "Zero human intervention required.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              const TextSpan(text: "\n\n"),
              const TextSpan(text: "My philosophy: "),
              const TextSpan(text: "AI should replace tasks, not just answer questions.", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // Quick facts
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _Tag(text: "🎓 B.Sc. AI — GPA 4.3/5"),
            _Tag(text: "🇸🇦 Based in Saudi Arabia"),
            _Tag(text: "🚀 Building Makn"),
          ],
        ),
      ],
    );
  }
}

class _AboutHighlights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HighlightCard(
          icon: Icons.smart_toy,
          title: "AI Agents",
          description: "I specialize in building autonomous AI systems that can think, decide, and act — replacing manual workflows entirely.",
          gradient: const [Color(0xFF00D4FF), Color(0xFF0099CC)],
        ),
        const SizedBox(height: 20),
        _HighlightCard(
          icon: Icons.rocket_launch,
          title: "Production-First",
          description: "Every project I build is designed to ship. Not demos, not POCs — real systems serving real users.",
          gradient: const [Color(0xFF7C3AED), Color(0xFF5B21B6)],
        ),
        const SizedBox(height: 20),
        _HighlightCard(
          icon: Icons.integration_instructions,
          title: "End-to-End AI Systems",
          description: "I take AI from model to user — training, FastAPI backends, Flutter clients, and messaging integrations. One person, one shipped system.",
          gradient: const [Color(0xFF00FF88), Color(0xFF00CC6A)],
        ),
      ],
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final IconData icon;
  final String title, description;
  final List<Color> gradient;
  const _HighlightCard({required this.icon, required this.title, required this.description, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white.withOpacity(0.05), Colors.white.withOpacity(0.02)],
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradient),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
                const SizedBox(height: 6),
                Text(description, style: const TextStyle(fontSize: 14, color: Colors.white60, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ========== SKILLS SECTION ==========
class _SkillsSection extends StatelessWidget {
  const _SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xFF0a0a0f), const Color(0xFF0f0f18), const Color(0xFF0a0a0f)],
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _SectionHeader(title: "Skills & Expertise", subtitle: "WHAT I DO"),
              const SizedBox(height: 60),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _SkillCard(
                    title: "AI & Machine Learning",
                    icon: Icons.psychology,
                    color: const Color(0xFF00D4FF),
                    skills: ["AI Agents", "LLMs", "RAG Systems", "Prompt Engineering", "Computer Vision", "TensorFlow", "PyTorch"],
                  ),
                  _SkillCard(
                    title: "Automation",
                    icon: Icons.auto_awesome,
                    color: const Color(0xFF7C3AED),
                    skills: ["n8n", "Workflow Automation", "WhatsApp API", "Chatbot Development", "API Integrations"],
                  ),
                  _SkillCard(
                    title: "Backend & APIs",
                    icon: Icons.dns,
                    color: const Color(0xFF00FF88),
                    skills: ["FastAPI", "Flask", "Python", "Firebase", "REST APIs", "Gemini API", "OpenAI API"],
                  ),
                  _SkillCard(
                    title: "Mobile & Frontend",
                    icon: Icons.phone_android,
                    color: const Color(0xFFFF6B6B),
                    skills: ["Flutter", "Dart", "Firebase Auth", "Firestore", "Responsive Design"],
                  ),
                  _SkillCard(
                    title: "Data & Analytics",
                    icon: Icons.analytics,
                    color: const Color(0xFFFFBB00),
                    skills: ["Python", "Pandas", "SQL", "Data Visualization"],
                  ),
                  _SkillCard(
                    title: "Tools & DevOps",
                    icon: Icons.build,
                    color: const Color(0xFFFF8800),
                    skills: ["Git", "Docker", "Linux", "VS Code", "Streamlit", "CI/CD"],
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

class _SkillCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> skills;
  const _SkillCard({required this.title, required this.icon, required this.color, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withOpacity(0.3)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withOpacity(0.1), color.withOpacity(0.02)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white))),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((s) => _SkillChip(text: s, color: color)).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String text;
  final Color color;
  const _SkillChip({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(text, style: TextStyle(fontSize: 13, color: color, fontWeight: FontWeight.w500)),
    );
  }
}

// ========== PROJECTS SECTION ==========
class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({super.key});

  final List<_ProjectData> projects = const [
    _ProjectData(
      title: "Makn AI Booking Agent",
      subtitle: "Autonomous AI System",
      description: "A fully autonomous AI agent that manages clinic appointments end-to-end. Books, cancels, reschedules, detects conflicts, and sends WhatsApp reminders — all without human intervention. Built to replace receptionist workflows entirely.",
      tech: ["FastAPI", "n8n", "Gemini API", "Firebase", "WhatsApp API", "Python"],
      gradient: [Color(0xFF00D4FF), Color(0xFF0099CC)],
      icon: Icons.smart_toy,
      featured: true,
    ),
    _ProjectData(
      title: "DermAI",
      subtitle: "Medical AI Application",
      description: "Dermatology booking app with ML-powered skin condition analysis. Patients photograph affected areas, and the ML model provides preliminary diagnosis to doctors before the patient arrives — improving consultation efficiency.",
      tech: ["Flutter", "Firebase", "TensorFlow", "Python", "ML"],
      gradient: [Color(0xFF7C3AED), Color(0xFF5B21B6)],
      icon: Icons.local_hospital,
      featured: true,
    ),
    _ProjectData(
      title: "Waqti",
      subtitle: "Graduation Project",
      description: "Hospital queue management system with ML-powered crowd estimation and QR-based booking. Real-time navigation helps patients find their way while predicting wait times.",
      tech: ["Flutter", "Firebase", "Flask", "Google Maps API", "ML"],
      gradient: [Color(0xFF00FF88), Color(0xFF00CC6A)],
      icon: Icons.timer,
      featured: false,
    ),
    _ProjectData(
      title: "News Research RAG",
      subtitle: "AI Research Tool",
      description: "RAG-powered research assistant that extracts content from URLs, chunks and embeds text into FAISS, then answers questions with grounded citations from the source material.",
      tech: ["LangChain", "FAISS", "Transformers", "Streamlit", "Python"],
      gradient: [Color(0xFFFF6B6B), Color(0xFFEE5A5A)],
      icon: Icons.article,
      featured: false,
    ),
    _ProjectData(
      title: "Medical Image Classification",
      subtitle: "Computer Vision",
      description: "Deep learning models for medical image analysis: potato disease detection (97.7% accuracy) and lung cancer detection using transfer learning with ResNet18.",
      tech: ["TensorFlow", "PyTorch", "Keras", "Streamlit", "CV"],
      gradient: [Color(0xFFFFBB00), Color(0xFFFF9900)],
      icon: Icons.biotech,
      featured: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _SectionHeader(title: "Featured Projects", subtitle: "MY WORK"),
              const SizedBox(height: 60),
              // Featured projects (large cards)
              ...projects.where((p) => p.featured).map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: _FeaturedProjectCard(project: p, isWide: isWide),
              )),
              const SizedBox(height: 20),
              // Other projects (grid)
              Wrap(
                spacing: 24,
                runSpacing: 24,
                children: projects.where((p) => !p.featured).map((p) => _ProjectCard(project: p)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectData {
  final String title, subtitle, description, badge;
  final List<String> tech;
  final List<Color> gradient;
  final IconData icon;
  final bool featured;
  final String? githubUrl;
  final String? metric;
  const _ProjectData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.badge,
    required this.tech,
    required this.gradient,
    required this.icon,
    required this.featured,
    this.githubUrl,
    this.metric,
  });
}

class _FeaturedProjectCard extends StatelessWidget {
  final _ProjectData project;
  final bool isWide;
  const _FeaturedProjectCard({required this.project, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: project.gradient[0].withOpacity(0.4)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [project.gradient[0].withOpacity(0.15), project.gradient[1].withOpacity(0.05)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: project.gradient),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(project.icon, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.subtitle, style: TextStyle(fontSize: 14, color: project.gradient[0], fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(project.title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: project.gradient[0].withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(project.badge, style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(project.description, style: const TextStyle(fontSize: 16, color: Colors.white70, height: 1.7)),
          if (project.metric != null) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.bar_chart, color: project.gradient[0], size: 16),
                const SizedBox(width: 8),
                Text(project.metric!, style: TextStyle(fontSize: 14, color: project.gradient[0], fontWeight: FontWeight.w600)),
              ],
            ),
          ],
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: project.tech.map((t) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(t, style: const TextStyle(fontSize: 13, color: Colors.white70, fontWeight: FontWeight.w500)),
                  )).toList(),
                ),
              ),
            ],
          ),
          if (project.githubUrl != null) ...[
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _launch(project.githubUrl!),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.05),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.code, color: Colors.white60, size: 16),
                    SizedBox(width: 8),
                    Text("View on GitHub", style: TextStyle(fontSize: 13, color: Colors.white60, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final _ProjectData project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        color: Colors.white.withOpacity(0.03),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: project.gradient),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(project.icon, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.subtitle, style: TextStyle(fontSize: 12, color: project.gradient[0], fontWeight: FontWeight.w500)),
                    Text(project.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: project.gradient[0].withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: project.gradient[0].withOpacity(0.3)),
                ),
                child: Text(project.badge, style: TextStyle(fontSize: 10, color: project.gradient[0], fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(project.description, style: const TextStyle(fontSize: 14, color: Colors.white60, height: 1.6), maxLines: 3, overflow: TextOverflow.ellipsis),
          if (project.metric != null) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.bar_chart, color: project.gradient[0], size: 13),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(project.metric!, style: TextStyle(fontSize: 12, color: project.gradient[0], fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.tech.take(4).map((t) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: project.gradient[0].withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(t, style: TextStyle(fontSize: 11, color: project.gradient[0], fontWeight: FontWeight.w500)),
            )).toList(),
          ),
          if (project.githubUrl != null) ...[
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _launch(project.githubUrl!),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.code, color: Colors.white38, size: 14),
                  const SizedBox(width: 6),
                  const Text("GitHub", style: TextStyle(fontSize: 12, color: Colors.white38, fontWeight: FontWeight.w500)),
                  const SizedBox(width: 4),
                  const Icon(Icons.open_in_new, color: Colors.white38, size: 12),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ========== CONTACT SECTION ==========
class _ContactSection extends StatelessWidget {
  final String email, github, linkedin, location;
  const _ContactSection({super.key, required this.email, required this.github, required this.linkedin, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xFF0a0a0f), const Color(0xFF0f0f18)],
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _SectionHeader(title: "Let's Work Together", subtitle: "CONTACT"),
              const SizedBox(height: 24),
              const Text(
                "Have a project in mind? I'm always open to discussing new opportunities, AI projects, or potential collaborations.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white70, height: 1.6),
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: const Color(0xFF00D4FF).withOpacity(0.3)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color(0xFF00D4FF).withOpacity(0.1), const Color(0xFF7C3AED).withOpacity(0.05)],
                  ),
                ),
                child: Column(
                  children: [
                    _ContactItem(
                      icon: Icons.email,
                      label: "Email",
                      value: email,
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: email));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text("Email copied to clipboard"),
                          backgroundColor: const Color(0xFF00D4FF),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          duration: const Duration(seconds: 2),
                        ));
                      },
                      actionIcon: Icons.copy,
                    ),
                    const SizedBox(height: 24),
                    _ContactItem(icon: Icons.code, label: "GitHub", value: "Faisalmoh99", onTap: () => _launch(github)),
                    const SizedBox(height: 24),
                    _ContactItem(icon: Icons.work, label: "LinkedIn", value: "faisal-alhajjah", onTap: () => _launch(linkedin)),
                    const SizedBox(height: 24),
                    _ContactItem(icon: Icons.location_on, label: "Location", value: location, onTap: null),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              _GradientButton(
                label: "Copy Email",
                onTap: () {
                  Clipboard.setData(ClipboardData(text: email));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text("Email copied to clipboard"),
                    backgroundColor: const Color(0xFF00D4FF),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    duration: const Duration(seconds: 2),
                  ));
                },
                icon: Icons.copy,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label, value;
  final VoidCallback? onTap;
  final IconData? actionIcon;
  const _ContactItem({required this.icon, required this.label, required this.value, this.onTap, this.actionIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF00D4FF), size: 22),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 13, color: Colors.white70)),
              const SizedBox(height: 2),
              Text(value, style: TextStyle(fontSize: 16, color: onTap != null ? const Color(0xFF00D4FF) : Colors.white, fontWeight: FontWeight.w500)),
            ],
          ),
          if (onTap != null) ...[
            const Spacer(),
            Icon(actionIcon ?? Icons.arrow_forward, color: Colors.white.withOpacity(0.3), size: 18),
          ],
        ],
      ),
    );
  }
}

// ========== FOOTER ==========
class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Container(height: 1, color: Colors.white.withOpacity(0.1)),
          const SizedBox(height: 32),
          Text("© ${DateTime.now().year} Faisal Alhajah. Built with Flutter 💙", style: const TextStyle(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }
}

// ========== REUSABLE COMPONENTS ==========
class _SectionHeader extends StatelessWidget {
  final String title, subtitle;
  const _SectionHeader({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(subtitle, style: const TextStyle(fontSize: 14, color: Color(0xFF00D4FF), fontWeight: FontWeight.w600, letterSpacing: 2)),
        const SizedBox(height: 12),
        Text(title, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: Colors.white)),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _NavItem({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _DrawerItem({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}

class _GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  const _GradientButton({required this.label, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF7C3AED)]),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: const Color(0xFF00D4FF).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
                if (icon != null) ...[const SizedBox(width: 10), Icon(icon, color: Colors.white, size: 18)],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  const _OutlineButton({required this.label, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white70)),
                if (icon != null) ...[const SizedBox(width: 10), Icon(icon, color: Colors.white70, size: 18)],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number, label;
  const _StatItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF7C3AED)]).createShader(bounds),
          child: Text(number, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: Colors.white)),
        ),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.white70)),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  const _Tag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 14, color: Colors.white70)),
    );
  }
}

// ========== URL LAUNCHER ==========
Future<void> _launch(String url) async {
  try {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } catch (_) {}
}
*/



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

// =========================================================
//  Faisal Alhajah — AI Engineer & Founder Portfolio
//  Premium Dark Theme with Glassmorphism
// =========================================================

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Faisal Alhajah — AI Engineer",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0a0a0f),
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00D4FF),
          secondary: Color(0xFF7C3AED),
          surface: Color(0xFF0a0a0f),
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
  final _scroll = ScrollController();
  final _heroKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  // Personal Info
  final String name = "Faisal Alhajah";
  final String role = "AI Engineer & Founder";
  final String email = "faisal.alhajjah@gmail.com";
  final String github = "https://github.com/Faisalmoh99";
  final String linkedin = "https://www.linkedin.com/in/faisal-alhajjah";
  final String location = "Saudi Arabia";

  Future<void> _goTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(ctx, duration: const Duration(milliseconds: 600), curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(isWide),
      drawer: isWide ? null : _buildDrawer(),
      body: Stack(
        children: [
          // Animated Background
          _AnimatedBackground(),
          // Content
          SingleChildScrollView(
            controller: _scroll,
            child: Column(
              children: [
                _HeroSection(key: _heroKey, name: name, role: role, email: email, github: github, linkedin: linkedin, onViewWork: () => _goTo(_projectsKey), onContact: () => _goTo(_contactKey), onDownloadCV: () => _launch("cv.pdf")),
                _ExperienceSection(key: _experienceKey),
                _AboutSection(key: _aboutKey),
                _SkillsSection(key: _skillsKey),
                _ProjectsSection(key: _projectsKey),
                _ContactSection(key: _contactKey, email: email, github: github, linkedin: linkedin, location: location),
                const SizedBox(height: 40),
                _Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(bool isWide) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [const Color(0xFF0a0a0f).withOpacity(0.9), const Color(0xFF0a0a0f).withOpacity(0)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                // Logo
                GestureDetector(
                  onTap: () => _goTo(_heroKey),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF7C3AED)]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text("F", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white)),
                      ),
                      const SizedBox(width: 12),
                      const Text("Faisal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                const Spacer(),
                if (isWide) ...[
                  _NavItem(text: "Experience", onTap: () => _goTo(_experienceKey)),
                  _NavItem(text: "About", onTap: () => _goTo(_aboutKey)),
                  _NavItem(text: "Skills", onTap: () => _goTo(_skillsKey)),
                  _NavItem(text: "Projects", onTap: () => _goTo(_projectsKey)),
                  _NavItem(text: "Contact", onTap: () => _goTo(_contactKey)),
                  const SizedBox(width: 20),
                  _GradientButton(label: "Let's Talk", onTap: () => _launch("mailto:$email")),
                ] else
                  IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: const Color(0xFF0a0a0f),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Menu", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              const SizedBox(height: 32),
              _DrawerItem(text: "Experience", onTap: () { Navigator.pop(context); _goTo(_experienceKey); }),
              _DrawerItem(text: "About", onTap: () { Navigator.pop(context); _goTo(_aboutKey); }),
              _DrawerItem(text: "Skills", onTap: () { Navigator.pop(context); _goTo(_skillsKey); }),
              _DrawerItem(text: "Projects", onTap: () { Navigator.pop(context); _goTo(_projectsKey); }),
              _DrawerItem(text: "Contact", onTap: () { Navigator.pop(context); _goTo(_contactKey); }),
              const Spacer(),
              _GradientButton(label: "Let's Talk", onTap: () => _launch("mailto:$email")),
            ],
          ),
        ),
      ),
    );
  }
}

// ========== ANIMATED BACKGROUND ==========
class _AnimatedBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gradient orbs
        Positioned(top: -100, right: -100, child: _GlowOrb(color: const Color(0xFF00D4FF), size: 400)),
        Positioned(top: 400, left: -150, child: _GlowOrb(color: const Color(0xFF7C3AED), size: 350)),
        Positioned(bottom: 200, right: -100, child: _GlowOrb(color: const Color(0xFF00D4FF), size: 300)),
        // Grid overlay
        Positioned.fill(
          child: CustomPaint(painter: _GridPainter()),
        ),
      ],
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final Color color;
  final double size;
  const _GlowOrb({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color.withOpacity(0.3), color.withOpacity(0.1), color.withOpacity(0)],
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.03)
      ..strokeWidth = 1;
    const spacing = 60.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ========== HERO SECTION ==========
class _HeroSection extends StatelessWidget {
  final String name, role, email, github, linkedin;
  final VoidCallback onViewWork;
  final VoidCallback onContact;
  final VoidCallback onDownloadCV;
  const _HeroSection({super.key, required this.name, required this.role, required this.email, required this.github, required this.linkedin, required this.onViewWork, required this.onContact, required this.onDownloadCV});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;
    
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      padding: EdgeInsets.fromLTRB(24, isWide ? 180 : 140, 24, 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF00D4FF).withOpacity(0.5)),
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFF00D4FF).withOpacity(0.1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFF00FF88), shape: BoxShape.circle)),
                const SizedBox(width: 10),
                const Text("Available for Full-time & Contract roles", style: TextStyle(color: Color(0xFF00D4FF), fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Name with gradient
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(colors: [Colors.white, Color(0xFFa0a0a0)]).createShader(bounds),
            child: Text(name, style: TextStyle(fontSize: isWide ? 72 : 48, fontWeight: FontWeight.w800, color: Colors.white, height: 1.1)),
          ),
          const SizedBox(height: 16),
          // Role with gradient
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF7C3AED)]).createShader(bounds),
            child: Text(role, style: TextStyle(fontSize: isWide ? 32 : 24, fontWeight: FontWeight.w700, color: Colors.white)),
          ),
          const SizedBox(height: 24),
          // Tagline
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Text(
              "I build AI systems that actually work in production — from autonomous agents that replace manual tasks to ML-powered apps serving real users.",
              style: TextStyle(fontSize: isWide ? 20 : 17, color: Colors.white70, height: 1.6),
            ),
          ),
          const SizedBox(height: 40),
          // CTA Buttons
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _GradientButton(label: "View My Work", onTap: onViewWork, icon: Icons.arrow_forward),
              _OutlineButton(label: "Download CV", onTap: onDownloadCV, icon: Icons.download),
              _OutlineButton(label: "Contact Me", onTap: onContact),
            ],
          ),
          const SizedBox(height: 48),
          // Stats
          Wrap(
            spacing: 48,
            runSpacing: 24,
            children: [
              _StatItem(number: "2+", label: "Years Building AI"),
              _StatItem(number: "7+", label: "Shipped Projects"),
              _StatItem(number: "3+", label: "AI Agents Built"),
            ],
          ),
        ],
      ),
    );
  }
}

// ========== ABOUT SECTION ==========
class _AboutSection extends StatelessWidget {
  const _AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _SectionHeader(title: "About Me", subtitle: "WHO I AM"),
              const SizedBox(height: 60),
              isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _AboutContent()),
                        const SizedBox(width: 60),
                        Expanded(child: _AboutHighlights()),
                      ],
                    )
                  : Column(
                      children: [
                        _AboutContent(),
                        const SizedBox(height: 40),
                        _AboutHighlights(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 18, color: Colors.white70, height: 1.8),
            children: [
              const TextSpan(text: "I'm not your typical AI graduate. While others build "),
              TextSpan(text: "tutorial projects", style: TextStyle(color: Colors.white.withOpacity(0.5), decoration: TextDecoration.lineThrough)),
              const TextSpan(text: ", I build "),
              const TextSpan(text: "production systems", style: TextStyle(color: Color(0xFF00D4FF), fontWeight: FontWeight.w600)),
              const TextSpan(text: " that solve real problems.\n\n"),
              const TextSpan(text: "As the "),
              const TextSpan(text: "Founder of Mokn", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              const TextSpan(text: ", I built an "),
              const TextSpan(text: "autonomous AI agent", style: TextStyle(color: Color(0xFF7C3AED), fontWeight: FontWeight.w600)),
              const TextSpan(text: " designed to handle clinic bookings end-to-end — scheduling, cancellations, conflict detection, and WhatsApp reminders. "),
              const TextSpan(text: "Zero human intervention required.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              const TextSpan(text: "\n\n"),
              const TextSpan(text: "My philosophy: "),
              const TextSpan(text: "AI should replace tasks, not just answer questions.", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
            ],
          ),
        ),
        const SizedBox(height: 32),
        // Quick facts
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _Tag(text: "🎓 B.Sc. AI — GPA 4.3/5"),
            _Tag(text: "🇸🇦 Based in Saudi Arabia"),
            _Tag(text: "🚀 Building Mokn"),
          ],
        ),
      ],
    );
  }
}

class _AboutHighlights extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HighlightCard(
          icon: Icons.smart_toy,
          title: "AI Agents",
          description: "I specialize in building autonomous AI systems that can think, decide, and act — replacing manual workflows entirely.",
          gradient: const [Color(0xFF00D4FF), Color(0xFF0099CC)],
        ),
        const SizedBox(height: 20),
        _HighlightCard(
          icon: Icons.rocket_launch,
          title: "Production-First",
          description: "Every project I build is designed to ship. Not demos, not POCs — real systems serving real users.",
          gradient: const [Color(0xFF7C3AED), Color(0xFF5B21B6)],
        ),
        const SizedBox(height: 20),
        _HighlightCard(
          icon: Icons.integration_instructions,
          title: "End-to-End AI Systems",
          description: "I take AI from model to user — training, FastAPI backends, Flutter clients, and messaging integrations. One person, one shipped system.",
          gradient: const [Color(0xFF00FF88), Color(0xFF00CC6A)],
        ),
      ],
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final IconData icon;
  final String title, description;
  final List<Color> gradient;
  const _HighlightCard({required this.icon, required this.title, required this.description, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white.withOpacity(0.05), Colors.white.withOpacity(0.02)],
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradient),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
                const SizedBox(height: 6),
                Text(description, style: const TextStyle(fontSize: 14, color: Colors.white60, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ========== SKILLS SECTION ==========
class _SkillsSection extends StatelessWidget {
  const _SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xFF0a0a0f), const Color(0xFF0f0f18), const Color(0xFF0a0a0f)],
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _SectionHeader(title: "Skills & Expertise", subtitle: "WHAT I DO"),
              const SizedBox(height: 60),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _SkillCard(
                    title: "AI & Machine Learning",
                    icon: Icons.psychology,
                    color: const Color(0xFF00D4FF),
                    skills: ["AI Agents", "LLMs", "RAG Systems", "Prompt Engineering", "Computer Vision", "TensorFlow", "PyTorch"],
                  ),
                  _SkillCard(
                    title: "Automation",
                    icon: Icons.auto_awesome,
                    color: const Color(0xFF7C3AED),
                    skills: ["n8n", "Workflow Automation", "WhatsApp API", "Chatbot Development", "API Integrations"],
                  ),
                  _SkillCard(
                    title: "Backend & APIs",
                    icon: Icons.dns,
                    color: const Color(0xFF00FF88),
                    skills: ["FastAPI", "Flask", "Python", "Firebase", "REST APIs", "Gemini API", "OpenAI API"],
                  ),
                  _SkillCard(
                    title: "Mobile & Frontend",
                    icon: Icons.phone_android,
                    color: const Color(0xFFFF6B6B),
                    skills: ["Flutter", "Dart", "Firebase Auth", "Firestore", "Responsive Design"],
                  ),
                  _SkillCard(
                    title: "Data & Analytics",
                    icon: Icons.analytics,
                    color: const Color(0xFFFFBB00),
                    skills: ["Python", "Pandas", "SQL", "Data Visualization"],
                  ),
                  _SkillCard(
                    title: "Tools & DevOps",
                    icon: Icons.build,
                    color: const Color(0xFFFF8800),
                    skills: ["Git", "Docker", "Linux", "VS Code", "Streamlit", "CI/CD"],
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

class _SkillCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> skills;
  const _SkillCard({required this.title, required this.icon, required this.color, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withOpacity(0.3)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.withOpacity(0.1), color.withOpacity(0.02)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: color.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white))),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((s) => _SkillChip(text: s, color: color)).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String text;
  final Color color;
  const _SkillChip({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(text, style: TextStyle(fontSize: 13, color: color, fontWeight: FontWeight.w500)),
    );
  }
}

// ========== PROJECTS SECTION ==========
class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({super.key});

  final List<_ProjectData> projects = const [
    _ProjectData(
      title: "MeshSense",
      subtitle: "Industrial AI",
      badge: "Open Source",
      description: "Industrial predictive maintenance via swarm of mobile sensor agents — IsolationForest + Autoencoder anomaly detection with layered clean architecture.",
      metric: "Real-time anomaly detection on WebSocket sensor streams; PostgreSQL-backed",
      tech: ["Python", "Scikit-learn", "WebSocket", "PostgreSQL"],
      gradient: [Color(0xFF00FF88), Color(0xFF00CC6A)],
      icon: Icons.sensors,
      featured: true,
      githubUrl: "https://github.com/Faisalmoh99/meshsense",
    ),
    _ProjectData(
      title: "Mokn AI Booking Agent",
      subtitle: "Autonomous AI System",
      badge: "Production-Ready",
      description: "A production-ready autonomous agent that handles clinic scheduling, rescheduling, cancellations and conflict detection via WhatsApp — fully built, tested, and deployable. Currently seeking pilot clinics for live deployment.",
      metric: "End-to-end front-desk automation — zero human handoff",
      tech: ["FastAPI", "Gemini", "WhatsApp API", "Firebase", "n8n"],
      gradient: [Color(0xFF00D4FF), Color(0xFF0099CC)],
      icon: Icons.smart_toy,
      featured: true,
    ),
    _ProjectData(
      title: "AI Real Estate Sales Agent (WhatsApp)",
      subtitle: "Conversational Sales Agent",
      badge: "Technical Assessment",
      description: "Conversational sales agent for a real estate company, built on n8n + Google Gemini as a take-home technical assessment in under 24 hours. Receives WhatsApp inquiries via Evolution API, extracts requirements through natural slot-filling, calls a property search API, and once the customer confirms a unit, generates a structured quote and delivers it as a PDF — no human handoff.",
      metric: "Full chat → structured quote → PDF pipeline shipped in under 24 hours",
      tech: ["n8n", "LangChain Agent", "Gemini", "WhatsApp (Evolution API)", "Tool-Calling", "Session Memory", "Structured Output"],
      gradient: [Color(0xFF00D4FF), Color(0xFF0099CC)],
      icon: Icons.real_estate_agent,
      featured: false,
    ),
    _ProjectData(
      title: "Mokn Academic",
      subtitle: "Multi-Agent System",
      badge: "AI Agent",
      description: "Multi-agent Arabic academic advisor — LangGraph cyclic negotiation between 3 specialized agents for automated course registration.",
      metric: "Built for Agenticthon 2026",
      tech: ["LangGraph", "Gemini", "ChromaDB", "FastAPI", "WhatsApp API"],
      gradient: [Color(0xFF7C3AED), Color(0xFF5B21B6)],
      icon: Icons.school,
      featured: false,
      githubUrl: "https://github.com/Faisalmoh99/mokn-academic",
    ),
    _ProjectData(
      title: "News Research RAG",
      subtitle: "AI Research Tool",
      badge: "RAG",
      description: "RAG pipeline with URL extraction, FAISS vector indexing, and grounded LLM answers with citations.",
      metric: "Zero API key dependency; Hugging Face Transformers for local inference",
      tech: ["LangChain", "FAISS", "Transformers", "Streamlit"],
      gradient: [Color(0xFFFF8800), Color(0xFFFF6600)],
      icon: Icons.article,
      featured: false,
      githubUrl: "https://github.com/Faisalmoh99/news-research-rag",
    ),
    _ProjectData(
      title: "Moustashfak",
      subtitle: "Healthcare Platform",
      badge: "Flutter",
      description: "Full-stack hospital system — patient mobile app, staff dashboard, and admin panel with real-time queue management and push notifications.",
      metric: "3-tier RBAC: patient app, staff dashboard, admin panel",
      tech: ["Flutter", "Riverpod", "GoRouter", "Firebase"],
      gradient: [Color(0xFFFF6B6B), Color(0xFFEE5A5A)],
      icon: Icons.local_hospital,
      featured: false,
      githubUrl: "https://github.com/Faisalmoh99/moustashfak",
    ),
    _ProjectData(
      title: "DermAI",
      subtitle: "Medical AI Application",
      badge: "Client Project",
      description: "Dual patient/doctor dermatology app — ML-powered skin condition analysis gives doctors diagnostic insights before patient arrival.",
      metric: "Client project",
      tech: ["Flutter", "Firebase", "TensorFlow", "ZegoCloud"],
      gradient: [Color(0xFFFFBB00), Color(0xFFFF9900)],
      icon: Icons.medical_services,
      featured: false,
    ),
    _ProjectData(
      title: "Waqti",
      subtitle: "Graduation Project",
      badge: "Flutter",
      description: "Hospital smart queue with QR check-in, Google Maps indoor navigation, Dialogflow chatbot, and ML-powered crowd prediction.",
      metric: "Graduation project — GPA 4.3/5.0; ML crowd prediction + geospatial navigation",
      tech: ["Flutter", "Firebase", "Google Maps", "Dialogflow", "Flask"],
      gradient: [Color(0xFF00D4FF), Color(0xFF0099CC)],
      icon: Icons.timer,
      featured: false,
      githubUrl: "https://github.com/Faisalmoh99/WAqti",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _SectionHeader(title: "Featured Projects", subtitle: "MY WORK"),
              const SizedBox(height: 60),
              // Featured projects (large cards)
              ...projects.where((p) => p.featured).map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: _FeaturedProjectCard(project: p, isWide: isWide),
              )),
              const SizedBox(height: 20),
              // Other projects (grid)
              Wrap(
                spacing: 24,
                runSpacing: 24,
                children: projects.where((p) => !p.featured).map((p) => _ProjectCard(project: p)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectData {
  final String title, subtitle, description, badge;
  final List<String> tech;
  final List<Color> gradient;
  final IconData icon;
  final bool featured;
  final String? githubUrl;
  final String? metric;
  const _ProjectData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.badge,
    required this.tech,
    required this.gradient,
    required this.icon,
    required this.featured,
    this.githubUrl,
    this.metric,
  });
}

class _FeaturedProjectCard extends StatelessWidget {
  final _ProjectData project;
  final bool isWide;
  const _FeaturedProjectCard({required this.project, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: project.gradient[0].withOpacity(0.4)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [project.gradient[0].withOpacity(0.15), project.gradient[1].withOpacity(0.05)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: project.gradient),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(project.icon, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.subtitle, style: TextStyle(fontSize: 14, color: project.gradient[0], fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(project.title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: project.gradient[0].withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(project.badge, style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(project.description, style: const TextStyle(fontSize: 16, color: Colors.white70, height: 1.7)),
          if (project.metric != null) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.bar_chart, color: project.gradient[0], size: 16),
                const SizedBox(width: 8),
                Text(project.metric!, style: TextStyle(fontSize: 14, color: project.gradient[0], fontWeight: FontWeight.w600)),
              ],
            ),
          ],
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: project.tech.map((t) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(t, style: const TextStyle(fontSize: 13, color: Colors.white70, fontWeight: FontWeight.w500)),
                  )).toList(),
                ),
              ),
            ],
          ),
          if (project.githubUrl != null) ...[
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _launch(project.githubUrl!),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.05),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.code, color: Colors.white60, size: 16),
                    SizedBox(width: 8),
                    Text("View on GitHub", style: TextStyle(fontSize: 13, color: Colors.white60, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final _ProjectData project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        color: Colors.white.withOpacity(0.03),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: project.gradient),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(project.icon, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(project.subtitle, style: TextStyle(fontSize: 12, color: project.gradient[0], fontWeight: FontWeight.w500)),
                    Text(project.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: project.gradient[0].withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: project.gradient[0].withOpacity(0.3)),
                ),
                child: Text(project.badge, style: TextStyle(fontSize: 10, color: project.gradient[0], fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(project.description, style: const TextStyle(fontSize: 14, color: Colors.white60, height: 1.6), maxLines: 3, overflow: TextOverflow.ellipsis),
          if (project.metric != null) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.bar_chart, color: project.gradient[0], size: 13),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(project.metric!, style: TextStyle(fontSize: 12, color: project.gradient[0], fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.tech.take(4).map((t) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: project.gradient[0].withOpacity(0.15),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(t, style: TextStyle(fontSize: 11, color: project.gradient[0], fontWeight: FontWeight.w500)),
            )).toList(),
          ),
          if (project.githubUrl != null) ...[
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _launch(project.githubUrl!),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.code, color: Colors.white38, size: 14),
                  const SizedBox(width: 6),
                  const Text("GitHub", style: TextStyle(fontSize: 12, color: Colors.white38, fontWeight: FontWeight.w500)),
                  const SizedBox(width: 4),
                  const Icon(Icons.open_in_new, color: Colors.white38, size: 12),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ========== CONTACT SECTION ==========
class _ContactSection extends StatelessWidget {
  final String email, github, linkedin, location;
  const _ContactSection({super.key, required this.email, required this.github, required this.linkedin, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xFF0a0a0f), const Color(0xFF0f0f18)],
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _SectionHeader(title: "Let's Work Together", subtitle: "CONTACT"),
              const SizedBox(height: 24),
              const Text(
                "Have a project in mind? I'm always open to discussing new opportunities, AI projects, or potential collaborations.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white70, height: 1.6),
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: const Color(0xFF00D4FF).withOpacity(0.3)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color(0xFF00D4FF).withOpacity(0.1), const Color(0xFF7C3AED).withOpacity(0.05)],
                  ),
                ),
                child: Column(
                  children: [
                    _ContactItem(
                      icon: Icons.email,
                      label: "Email",
                      value: email,
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: email));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text("Email copied to clipboard"),
                          backgroundColor: const Color(0xFF00D4FF),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          duration: const Duration(seconds: 2),
                        ));
                      },
                      actionIcon: Icons.copy,
                    ),
                    const SizedBox(height: 24),
                    _ContactItem(icon: Icons.code, label: "GitHub", value: "Faisalmoh99", onTap: () => _launch(github)),
                    const SizedBox(height: 24),
                    _ContactItem(icon: Icons.work, label: "LinkedIn", value: "faisal-alhajjah", onTap: () => _launch(linkedin)),
                    const SizedBox(height: 24),
                    _ContactItem(icon: Icons.location_on, label: "Location", value: location, onTap: null),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              _GradientButton(
                label: "Copy Email",
                onTap: () {
                  Clipboard.setData(ClipboardData(text: email));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text("Email copied to clipboard"),
                    backgroundColor: const Color(0xFF00D4FF),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    duration: const Duration(seconds: 2),
                  ));
                },
                icon: Icons.copy,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label, value;
  final VoidCallback? onTap;
  final IconData? actionIcon;
  const _ContactItem({required this.icon, required this.label, required this.value, this.onTap, this.actionIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF00D4FF), size: 22),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 13, color: Colors.white70)),
              const SizedBox(height: 2),
              Text(value, style: TextStyle(fontSize: 16, color: onTap != null ? const Color(0xFF00D4FF) : Colors.white, fontWeight: FontWeight.w500)),
            ],
          ),
          if (onTap != null) ...[
            const Spacer(),
            Icon(actionIcon ?? Icons.arrow_forward, color: Colors.white.withOpacity(0.3), size: 18),
          ],
        ],
      ),
    );
  }
}

// ========== FOOTER ==========
class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          Container(height: 1, color: Colors.white.withOpacity(0.1)),
          const SizedBox(height: 32),
          Text("© ${DateTime.now().year} Faisal Alhajah. Built with Flutter 💙", style: const TextStyle(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }
}

// ========== REUSABLE COMPONENTS ==========
class _SectionHeader extends StatelessWidget {
  final String title, subtitle;
  const _SectionHeader({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(subtitle, style: const TextStyle(fontSize: 14, color: Color(0xFF00D4FF), fontWeight: FontWeight.w600, letterSpacing: 2)),
        const SizedBox(height: 12),
        Text(title, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: Colors.white)),
      ],
    );
  }
}

class _NavItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _NavItem({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _DrawerItem({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}

class _GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  const _GradientButton({required this.label, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF7C3AED)]),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: const Color(0xFF00D4FF).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
                if (icon != null) ...[const SizedBox(width: 10), Icon(icon, color: Colors.white, size: 18)],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  const _OutlineButton({required this.label, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white70)),
                if (icon != null) ...[const SizedBox(width: 10), Icon(icon, color: Colors.white70, size: 18)],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number, label;
  const _StatItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF7C3AED)]).createShader(bounds),
          child: Text(number, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: Colors.white)),
        ),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.white70)),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  const _Tag({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 14, color: Colors.white70)),
    );
  }
}

// ========== URL LAUNCHER ==========
Future<void> _launch(String url) async {
  try {
    await launchUrlString(url, mode: LaunchMode.externalApplication);
  } catch (_) {}
}
// ========== EXPERIENCE SECTION ==========
class _ExperienceSection extends StatelessWidget {
  const _ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xFF0a0a0f), const Color(0xFF0f0f18), const Color(0xFF0a0a0f)],
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _SectionHeader(title: "Experience", subtitle: "WHERE I'VE WORKED"),
              const SizedBox(height: 60),
              _ExperienceCard(
                company: "Mokn",
                role: "Founder & AI Engineer",
                period: "Late 2025 – Present",
                description: "Built production-ready AI systems for Saudi SMBs — autonomous clinic booking agents, WhatsApp automation, and SaaS review management tools.",
                color: const Color(0xFF00D4FF),
                isCurrent: true,
              ),
              const SizedBox(height: 20),
              _ExperienceCard(
                company: "Freelance",
                role: "AI & Software Developer",
                period: "2024 – Present",
                description: "Delivered Flutter apps and AI backends for clients across healthcare and retail sectors.",
                color: const Color(0xFF7C3AED),
                isCurrent: true,
              ),
              const SizedBox(height: 20),
              _ExperienceCard(
                company: "AI & Robotics Engineering Internship",
                role: "Intern · Jeddah",
                period: "Jul – Aug 2023",
                description: "ROS robotic arm automation project.",
                color: const Color(0xFF00FF88),
                isCurrent: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final String company, role, period, description;
  final Color color;
  final bool isCurrent;
  const _ExperienceCard({
    required this.company,
    required this.role,
    required this.period,
    required this.description,
    required this.color,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.03),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 3, color: color),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(company, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: color)),
                        ),
                        if (isCurrent)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00FF88).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: const Color(0xFF00FF88).withOpacity(0.4)),
                            ),
                            child: const Text("Current", style: TextStyle(fontSize: 11, color: Color(0xFF00FF88), fontWeight: FontWeight.w600)),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(role, style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    Text(period, style: const TextStyle(fontSize: 13, color: Colors.white54)),
                    const SizedBox(height: 12),
                    Text(description, style: const TextStyle(fontSize: 15, color: Colors.white70, height: 1.6)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
