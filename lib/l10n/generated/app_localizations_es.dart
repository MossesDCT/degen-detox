// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Cortisol Zero';

  @override
  String get appTagline => 'Tu compañero diario para reducir el estrés';

  @override
  String get navHome => 'Inicio';

  @override
  String get navLearn => 'Aprender';

  @override
  String get navBreathe => 'Respirar';

  @override
  String get navSounds => 'Sonidos';

  @override
  String get navMore => 'Más';

  @override
  String get greetingMorning => 'Buenos días';

  @override
  String get greetingAfternoon => 'Buenas tardes';

  @override
  String get greetingEvening => 'Buenas tardes';

  @override
  String get greetingNight => 'Buenas noches';

  @override
  String get dayStreak => 'días seguidos';

  @override
  String get dailyTip => 'Consejo del día';

  @override
  String get quickAccess => 'Acceso rápido';

  @override
  String get moodCheckin => '¿Cómo te sientes?';

  @override
  String get howAreYouFeeling => '¿Cómo te sientes hoy?';

  @override
  String get explore => 'Explorar';

  @override
  String get learnTitle => 'Aprender';

  @override
  String get learnSubtitle => 'Entiende el cortisol y cómo manejarlo';

  @override
  String get searchTopics => 'Buscar temas...';

  @override
  String get seeAll => 'Ver todo';

  @override
  String minuteRead(int count) {
    return '$count min de lectura';
  }

  @override
  String get noResultsFound => 'No se encontraron resultados';

  @override
  String get nutritionGuide => 'Guía de Nutrición';

  @override
  String get antiStressFoods => 'Alimentos Anti-Estrés';

  @override
  String get tapToLearnScience =>
      'Toca cualquier alimento para aprender cómo reduce el cortisol';

  @override
  String get servingIdea => 'Idea de porción';

  @override
  String get breatheTitle => 'Respirar';

  @override
  String get breatheSubtitle =>
      'Los ejercicios de respiración reducen el cortisol en minutos';

  @override
  String get scienceBackedTechniques => 'Técnicas respaldadas por la ciencia';

  @override
  String get vagusNerveInfo =>
      'Cada técnica activa el nervio vago para reducir el cortisol en minutos';

  @override
  String get beginner => 'Principiante';

  @override
  String get intermediate => 'Intermedio';

  @override
  String get advanced => 'Avanzado';

  @override
  String get phaseInhale => 'Inhala';

  @override
  String get phaseHold => 'Mantén';

  @override
  String get phaseExhale => 'Exhala';

  @override
  String get sessionComplete => '¡Sesión completa!';

  @override
  String get sessionCompleteMessage =>
      'Tus niveles de cortisol están bajando. Tómate un momento para sentir cómo estás.';

  @override
  String get cyclesCompleted => 'Ciclos';

  @override
  String get duration => 'Duración';

  @override
  String get done => 'Listo';

  @override
  String get endSession => 'Terminar sesión';

  @override
  String cycleOf(int current, int total) {
    return 'Ciclo $current de $total';
  }

  @override
  String get soundsTitle => 'Sonidos';

  @override
  String get soundsSubtitle =>
      'Sonidos de la naturaleza para calmar tu sistema nervioso';

  @override
  String nowPlaying(String name) {
    return 'Reproduciendo: $name';
  }

  @override
  String get tapToPlay => 'Toca para reproducir';

  @override
  String get paused => 'Pausado';

  @override
  String get sleepTimer => 'Temporizador de sueño';

  @override
  String get audioWillStop => 'El audio se detendrá automáticamente';

  @override
  String get cancelTimer => 'Cancelar temporizador';

  @override
  String sleepTimerSet(int minutes) {
    return 'Temporizador: $minutes min';
  }

  @override
  String get journalTitle => 'Diario de Humor';

  @override
  String get addEntry => 'Añadir entrada';

  @override
  String get saveEntry => 'Guardar entrada';

  @override
  String get noEntriesThisMonth => 'Sin entradas este mes';

  @override
  String get tapPlusToAdd => 'Toca + para añadir tu primera entrada';

  @override
  String weeklyAverage(String mood) {
    return 'Promedio semanal: $mood';
  }

  @override
  String get addNoteOptional =>
      'Añade una nota sobre cómo te sientes... (opcional)';

  @override
  String get moodTerrible => 'Fatal';

  @override
  String get moodBad => 'Mal';

  @override
  String get moodOkay => 'Regular';

  @override
  String get moodGood => 'Bien';

  @override
  String get moodGreat => 'Genial';

  @override
  String get sleepTrackerTitle => 'Seguimiento del Sueño';

  @override
  String get logSleep => 'Registrar sueño';

  @override
  String get sleepQuality => 'Calidad del sueño';

  @override
  String get bedtimeReminder => 'Recordatorio para dormir';

  @override
  String get avgQuality => 'Calidad media';

  @override
  String get avgDuration => 'Duración media';

  @override
  String get tracked => 'Registrado';

  @override
  String get bedtime => 'Hora de dormir';

  @override
  String get wakeTime => 'Hora de despertar';

  @override
  String get last7Days => 'Últimos 7 días';

  @override
  String get recentEntries => 'Entradas recientes';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get appearance => 'Apariencia';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get enableNotifications => 'Activar notificaciones';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get termsOfService => 'Términos de servicio';

  @override
  String get rateApp => 'Calificar la aplicación';

  @override
  String get version => 'Versión';

  @override
  String get about => 'Acerca de';

  @override
  String get proTitle => 'PRO';

  @override
  String get proActive => 'PRO — Activo ✓';

  @override
  String get upgradeToProCTA => 'Actualizar a PRO';

  @override
  String get upgradeSubtitle =>
      'Desbloquea el kit completo de reducción de estrés';

  @override
  String get proPrice => 'USD 6.50 pago único';

  @override
  String get oneTimePayment => 'Pago único • Acceso de por vida';

  @override
  String get noSubscription => 'Sin suscripción, sin cargos recurrentes';

  @override
  String unlockPro(String price) {
    return 'Desbloquear PRO — $price';
  }

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get proThankYou => '¡Gracias por tu apoyo!';

  @override
  String get youHavePro => '¡Tienes PRO!';

  @override
  String get proFeaturesUnlocked =>
      'Todas las funciones PRO están desbloqueadas.';

  @override
  String get awesome => '¡Genial!';

  @override
  String get checkingPurchases => 'Verificando compras...';

  @override
  String get recipeBook => 'Libro de recetas';

  @override
  String get recipes22 => '22 recetas que reducen el cortisol';

  @override
  String get searchRecipes => 'Buscar recetas...';

  @override
  String get ingredients => 'Ingredientes';

  @override
  String get instructions => 'Instrucciones';

  @override
  String get whyItWorks => 'Por qué funciona';

  @override
  String servings(int count) {
    return '$count porciones';
  }

  @override
  String prepTime(String time) {
    return 'Prep: $time';
  }

  @override
  String totalTime(String time) {
    return 'Total: $time';
  }

  @override
  String get meditationLibrary => 'Biblioteca de meditación';

  @override
  String get guidedMeditations => 'Meditaciones guiadas para el estrés';

  @override
  String get appBlocker => 'Bloqueador de apps';

  @override
  String get morningFocusMode => 'Modo de enfoque matutino';

  @override
  String get enableAppBlocker => 'Activar bloqueador';

  @override
  String get blockDuration => 'Duración del bloqueo';

  @override
  String get grantPermission => 'Conceder permiso';

  @override
  String get unlockWithBreathing =>
      'Completa un ejercicio de respiración de 5 minutos para desbloquear';

  @override
  String get moodInsights => 'Análisis de Humor IA';

  @override
  String get weeklyPatternAnalysis => 'Análisis semanal de patrones de humor';

  @override
  String get stressLevel => 'Nivel de estrés';

  @override
  String get avgMood => 'Humor medio';

  @override
  String get trend => 'Tendencia';

  @override
  String get weeklyMoodTrend => 'Tendencia semanal del humor';

  @override
  String get aiDetectedPatterns => 'Patrones detectados por IA';

  @override
  String get weeklyPersonalizedTip => 'Consejo personalizado semanal';

  @override
  String get onboarding1Title => 'Bienvenido a\nCortisol Zero';

  @override
  String get onboarding1Subtitle =>
      'Tu compañero diario para gestionar el estrés y construir una vida más tranquila.';

  @override
  String get onboarding2Title => 'Comprende\nTu Estrés';

  @override
  String get onboarding2Subtitle =>
      'El cortisol es tu hormona del estrés. Cuando está elevado crónicamente, afecta tu salud y sueño.';

  @override
  String get onboarding3Title => 'Tu Viaje\nComienza Ahora';

  @override
  String get onboarding3Subtitle =>
      'Solo 5 minutos al día con Cortisol Zero pueden reducir significativamente tu estrés en semanas.';

  @override
  String get continueButton => 'Continuar';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get skip => 'Omitir';

  @override
  String get moreTitle => 'Más';

  @override
  String get toolsSection => 'Herramientas';

  @override
  String get proFeaturesSection => 'Funciones PRO';

  @override
  String get unlockCortisolZeroPro => 'Desbloquear Cortisol Zero PRO';

  @override
  String get unlock => 'Desbloquear';

  @override
  String get save => 'Guardar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get close => 'Cerrar';

  @override
  String get change => 'Cambiar';

  @override
  String get scienceBacked => 'Reductor de cortisol respaldado por la ciencia';

  @override
  String get free => 'GRATIS';

  @override
  String get whatYouGet => 'Qué obtienes';

  @override
  String scheduledAt(String time) {
    return 'Programado: $time';
  }

  @override
  String get dailyTipBadge => 'Consejo diario';

  @override
  String get journalLabel => 'Diario';

  @override
  String get featureNutrition => 'Nutrición';

  @override
  String get featureNutritionSub => '20 alimentos antiestrés';

  @override
  String get featureSleep => 'Sueño';

  @override
  String get featureSleepSub => 'Seguimiento y mejora';

  @override
  String get nutritionBannerTitle => 'Guía de nutrición antiestrés';

  @override
  String get nutritionBannerSub => '20+ alimentos que reducen el cortisol';

  @override
  String minRead(int count) {
    return '$count min de lectura';
  }

  @override
  String get filterAll => 'Todo';

  @override
  String get filterBasics => 'Básicos';

  @override
  String get filterScience => 'Ciencia';

  @override
  String get filterImpact => 'Impacto';

  @override
  String get filterReduce => 'Reducir';

  @override
  String get filterLifestyle => 'Estilo';

  @override
  String get filterNutrition => 'Nutrición';

  @override
  String get filterSleep => 'Sueño';

  @override
  String get filterMind => 'Mente';

  @override
  String get catBasics => 'Lo básico';

  @override
  String get catScience => 'La ciencia';

  @override
  String get catImpact => 'Impacto en la salud';

  @override
  String get catReduction => 'Consejos de reducción';

  @override
  String get catLifestyle => 'Estilo de vida';

  @override
  String get catNutrition => 'Nutrición';

  @override
  String get catSleep => 'Sueño';

  @override
  String get catExercise => 'Ejercicio';

  @override
  String get catMindfulness => 'Mindfulness';

  @override
  String get dailyTip0 =>
      'Respira profundamente 5 veces ahora mismo. Cada exhalación larga activa el nervio vago y reduce el cortisol en 60 segundos.';

  @override
  String get dailyTip1 =>
      'Bebe un vaso de agua fría. La deshidratación leve aumenta el cortisol hasta un 33%. La hidratación es gestión del estrés.';

  @override
  String get dailyTip2 =>
      'Sal al exterior 10 minutos. La luz natural y la vegetación reducen el cortisol de forma medible — incluso un paseo corto funciona.';

  @override
  String get dailyTip3 =>
      'Deja el teléfono durante 30 minutos. Cada notificación provoca un micro pico de cortisol. Dale un descanso a tu sistema nervioso.';

  @override
  String get dailyTip4 =>
      'Come un puñado de almendras o chocolate negro. El magnesio y los flavanoles suprimen directamente el eje HPA.';

  @override
  String get dailyTip5 =>
      'Escribe 3 cosas por las que estés agradecido. Solo 5 minutos de gratitud reducen el cortisol un 23%.';

  @override
  String get dailyTip6 =>
      'Escucha música tranquila. La música a 432Hz reduce el cortisol y ralentiza el ritmo cardíaco.';

  @override
  String get dailyTip7 =>
      'Pasa tiempo con alguien que te importa. La oxitocina del contacto social positivo inhibe directamente el cortisol.';

  @override
  String get dailyTip8 =>
      'Prueba la respiración 4-7-8 antes de tu próxima tarea estresante. Inhala 4, mantén 7, exhala 8. Tranquilizante natural.';

  @override
  String get dailyTip9 =>
      'Desayuna dentro de los 90 minutos después de despertar. Saltarse el desayuno provoca picos de cortisol para mantener el azúcar en sangre.';

  @override
  String get dailyTip10 =>
      'Establece un toque de queda digital 1 hora antes de dormir. La luz azul suprime la melatonina y mantiene el cortisol elevado por la noche.';

  @override
  String get dailyTip11 =>
      'Mueve tu cuerpo durante 20 minutos. El ejercicio moderado crea un \"dividendo de cortisol\" — los niveles bajan por debajo de la línea base durante horas.';

  @override
  String get dailyTip12 =>
      'Prepara una taza de manzanilla o té verde. La L-teanina del té verde promueve la calma; la apigenina de la manzanilla se une a los receptores GABA.';

  @override
  String get dailyTip13 =>
      'Practica la relajación muscular progresiva. Tensa y relaja cada grupo muscular. Esto activa directamente el sistema nervioso parasimpático.';

  @override
  String get eduTitle000 => '¿Qué es el cortisol?';

  @override
  String get eduTitle001 => 'El ritmo del cortisol';

  @override
  String get eduTitle002 => 'El eje HPA explicado';

  @override
  String get eduTitle003 => 'Cortisol vs. adrenalina';

  @override
  String get eduTitle004 => 'Cómo el cortisol alto afecta tu cuerpo';

  @override
  String get eduTitle005 => 'El cortisol y tu estado de ánimo';

  @override
  String get eduTitle006 => 'Respiración profunda: la solución más rápida';

  @override
  String get eduTitle007 => 'El poder de la naturaleza';

  @override
  String get eduTitle008 => 'Ejercicio: el momento importa';

  @override
  String get eduTitle009 => 'La conexión social reduce el cortisol';

  @override
  String get eduTitle010 => 'Sueño y cortisol: el círculo vicioso';

  @override
  String get eduTitle011 => 'Yoga y la respuesta al estrés';

  @override
  String get eduTitle012 => 'Meditación mindfulness: resultados probados';

  @override
  String get eduTitle013 => 'Alimentos que aumentan el cortisol';

  @override
  String get eduTitle014 => 'La conexión intestino-cerebro-cortisol';

  @override
  String get eduTitle015 => 'Magnesio: el mineral antiestrés';

  @override
  String get eduTitle016 => 'El diario como medicina para el cortisol';

  @override
  String get eduContent000 =>
      'El cortisol es la principal hormona del estrés de tu cuerpo, producida por las glándulas suprarrenales situadas sobre los riñones. A menudo llamada la \"hormona del estrés\", desempeña un papel vital en la respuesta de lucha o huida.\n\nCuando enfrentas una situación estresante, el hipotálamo de tu cerebro desencadena una cascada de señales que conduce a la liberación de cortisol. Esto prepara tu cuerpo para luchar o huir — aumentando la frecuencia cardíaca, la presión arterial y el azúcar en sangre.\n\nEn cantidades saludables, el cortisol es esencial para la vida. Ayuda a regular el metabolismo, reduce la inflamación y asiste en la formación de memorias. El problema surge cuando los niveles de cortisol permanecen crónicamente elevados debido al estrés continuo.';

  @override
  String get eduContent001 =>
      'El cortisol sigue un ritmo diario natural llamado patrón diurno de cortisol. Los niveles son típicamente más altos por la mañana (alrededor de las 8 AM), lo que te ayuda a despertar y sentirte alerta. Disminuyen gradualmente durante el día, alcanzando su punto más bajo alrededor de la medianoche.\n\nEsto se llama Respuesta de Cortisol al Despertar (CAR). Una CAR saludable ve un aumento del cortisol del 50-160% dentro de los 30 minutos de despertar — el despertador propio de la naturaleza.\n\nLos estilos de vida modernos interrumpen este ritmo a través del mal sueño, el estrés crónico, la luz artificial por la noche y los horarios irregulares de comida.';

  @override
  String get eduContent002 =>
      'El eje Hipotalámico-Pituitario-Adrenal (HPA) es el sistema central de respuesta al estrés de tu cuerpo. Así es como funciona:\n\n1. **Hipotálamo** detecta el estrés y libera CRH (hormona liberadora de corticotropina)\n2. **Glándula pituitaria** recibe CRH y libera ACTH (hormona adrenocorticotrópica)\n3. **Glándulas suprarrenales** reciben ACTH y producen cortisol\n4. **Circuito de retroalimentación negativa**: cuando el cortisol es suficientemente alto, señala al hipotálamo para reducir la producción\n\nEl estrés crónico puede desregular este circuito, llevando a cortisol persistentemente elevado que el cuerpo ya no puede suprimir adecuadamente.';

  @override
  String get eduContent003 =>
      'Muchas personas confunden el cortisol con la adrenalina (epinefrina). Aunque ambas son hormonas del estrés, funcionan de manera diferente:\n\n**La adrenalina** es rápida — se activa en segundos durante el estrés agudo, causando que tu corazón se acelere y tus palmas suden. Sus efectos se desvanecen rápidamente.\n\n**El cortisol** es lento — tarda minutos en movilizarse pero sus efectos duran horas o días. Está diseñado para amenazas sostenidas, no repentinas.\n\nEl problema moderno es que nuestros estresores psicológicos (plazos, tráfico, redes sociales) activan continuamente la vía del cortisol — manteniéndolo elevado como si constantemente enfrentáramos un depredador.';

  @override
  String get eduContent004 =>
      'El cortisol crónicamente elevado tiene consecuencias de largo alcance:\n\n🩺 **Sistema inmunológico**: suprime la respuesta inmune, haciéndote más susceptible a enfermedades\n⚖️ **Peso**: promueve el almacenamiento de grasa, especialmente grasa visceral abdominal\n💤 **Sueño**: interrumpe los ciclos de sueño, causando insomnio\n🧠 **Cerebro**: deteriora la memoria y concentración; puede encoger el hipocampo con el tiempo\n❤️ **Corazón**: eleva la presión arterial y aumenta el riesgo cardiovascular\n🦴 **Huesos**: reduce la densidad ósea\n🩸 **Azúcar en sangre**: causa resistencia a la insulina\n\n¿La buena noticia? Estos efectos son en gran medida reversibles con un manejo adecuado del estrés.';

  @override
  String get eduContent005 =>
      'El vínculo entre el cortisol y la salud mental es profundo. El cortisol alto se asocia con:\n\n**Ansiedad**: el cortisol amplifica la detección de amenazas de la amígdala, haciendo que todo se sienta más peligroso.\n\n**Depresión**: el cortisol crónicamente alto reduce la serotonina y la dopamina — los neurotransmisores del \"bienestar\".\n\n**Niebla mental**: el cortisol compite con la glucosa en la corteza prefrontal, deteriorando el pensamiento claro y la toma de decisiones.\n\n**Reactividad emocional**: te vuelves más fácilmente provocado por frustraciones menores.\n\nEl cortisol muy bajo (fatiga adrenal) también puede causar depresión y fatiga extrema — el equilibrio es clave.';

  @override
  String get eduContent006 =>
      'La respiración profunda diafragmática es una de las formas más poderosas e inmediatas de reducir el cortisol. La ciencia:\n\nCuando respiras lenta y profundamente, activas el sistema nervioso parasimpático — la respuesta de \"descanso y digestión\" que contrarresta directamente la respuesta al estrés.\n\nEl nervio vago, que va desde tu cerebro hasta tu intestino, es estimulado por la respiración profunda. Esto envía una señal de \"seguridad\" por todo tu cuerpo, reduciendo los niveles de cortisol en minutos.\n\n**La técnica 4-7-8**: inhala durante 4 segundos, mantén durante 7, exhala durante 8. La exhalación prolongada es clave — activa el freno vagal en tu respuesta al estrés.';

  @override
  String get eduContent007 =>
      'Pasar tiempo en la naturaleza está científicamente probado que reduce el cortisol. La práctica japonesa \"Shinrin-yoku\" (baño de bosque) ha sido extensamente estudiada:\n\n🌿 Solo 20 minutos en un bosque reduce el cortisol un 15.8%\n🌳 Los espacios verdes reducen tanto el cortisol salival como la frecuencia cardíaca\n🌊 Los espacios azules (ambientes acuáticos) tienen efectos similares\n🌸 Incluso ver imágenes de la naturaleza reduce los marcadores de estrés\n\nNo necesitas un bosque. Incluso una caminata de 10 minutos en un parque local, cuidar plantas o sentarte junto a una ventana con vista al jardín activa el efecto calmante de la naturaleza.';

  @override
  String get eduContent008 =>
      'El ejercicio es una espada de doble filo con el cortisol. Entender esto te ayuda a optimizar tus entrenamientos:\n\n**Durante el ejercicio**: el cortisol sube para movilizar energía — esto es saludable y normal.\n\n**Después del ejercicio moderado**: el cortisol cae por debajo de la línea base durante horas, proporcionando un \"dividendo de cortisol\".\n\n**Sobreentrenamiento**: el ejercicio excesivo de alta intensidad mantiene el cortisol crónicamente elevado.\n\n**Mejores prácticas**:\n• Cardio moderado por la mañana (30-45 min) es óptimo\n• Evita entrenamientos intensos por la noche\n• Incorpora días de descanso\n• El yoga y el tai chi son especialmente efectivos para reducir el cortisol';

  @override
  String get eduContent009 =>
      'La conexión humana es un poderoso amortiguador del cortisol. Las investigaciones muestran:\n\n• **La oxitocina** (la \"hormona del vínculo\") inhibe directamente la liberación de cortisol\n• Las personas con fuerte apoyo social tienen una respuesta de cortisol al estrés un 25% menor\n• Incluso breves interacciones sociales positivas reducen el cortisol\n• Tener mascotas reduce significativamente el cortisol — acariciar un perro durante 10 minutos lo reduce de forma medible\n• La soledad eleva el cortisol — se percibe como una amenaza de supervivencia\n\nPor eso el aislamiento es tan físicamente dañino. Tu cuerpo genuinamente necesita contacto social para regular su respuesta al estrés.';

  @override
  String get eduContent010 =>
      'El cortisol alto y el mal sueño forman un peligroso circuito de retroalimentación:\n\n**Cortisol alto → mal sueño**: el cortisol es estimulante. Cuando está elevado por la noche, impide que el cerebro alcance las fases de sueño profundo y restaurador.\n\n**Mal sueño → cortisol alto**: incluso una noche de mal sueño eleva el cortisol un 37% al día siguiente.\n\n**Cómo romper el ciclo**:\n✓ Mantén un horario consistente de sueño/vigilia (incluso los fines de semana)\n✓ Evita pantallas 1 hora antes de dormir\n✓ Mantén tu dormitorio fresco (18-20°C es óptimo)\n✓ Evita la cafeína después de las 2 PM\n✓ Practica una rutina de relajación antes de dormir';

  @override
  String get eduContent011 =>
      'El yoga es una de las intervenciones más estudiadas para la reducción del cortisol:\n\n**Los estudios muestran** que 8 semanas de práctica regular de yoga reducen el cortisol matutino hasta un 30%.\n\n**Por qué funciona el yoga**:\n• Combina respiración, movimiento y mindfulness — triple efecto reductor de cortisol\n• Activa el sistema nervioso parasimpático a través de la respiración consciente\n• Reduce la reactividad de la amígdala\n• Mejora los niveles de GABA — el neurotransmisor calmante del cerebro\n\n**Mejores estilos para el cortisol**: Hatha, Yin, Restaurativo y Yoga Nidra son particularmente efectivos. Incluso 10 minutos de yoga suave antes de dormir pueden transformar la calidad del sueño.';

  @override
  String get eduContent012 =>
      'La Reducción del Estrés Basada en Mindfulness (MBSR) ha sido rigurosamente estudiada desde los años 70. Los resultados son convincentes:\n\n🧪 **8 semanas** de MBSR reduce el cortisol un 20-25%\n🧠 **Cambia la estructura cerebral**: aumenta la corteza prefrontal (pensamiento racional) mientras reduce la amígdala (centro del miedo)\n💊 **Equivalente a medicación** para ansiedad leve-moderada en múltiples ensayos\n❤️ **Reduce marcadores de inflamación** (PCR, IL-6) vinculados al cortisol\n\nNo necesitas horas. La investigación muestra que **10 minutos diarios** de práctica de mindfulness producen reducciones medibles de cortisol en 4 semanas.';

  @override
  String get eduContent013 =>
      'Tu dieta influye directamente en el cortisol. Estos alimentos pueden elevar las hormonas del estrés:\n\n☕ **Cafeína**: eleva el cortisol un 30% incluso en bebedores habituales de café. Espera 90 minutos después de despertar antes de tu primera taza.\n\n🍬 **Picos de azúcar**: las oscilaciones rápidas de glucosa desencadenan la liberación de cortisol. Elige alimentos de bajo índice glucémico.\n\n🥃 **Alcohol**: inicialmente sedante, el alcohol interrumpe la arquitectura del sueño y eleva el cortisol al día siguiente.\n\n🔥 **Alimentos inflamatorios**: las grasas trans y los alimentos ultraprocesados aumentan la inflamación sistémica, que eleva el cortisol.\n\n🧂 **Exceso de sodio**: una dieta alta en sodio está vinculada a niveles elevados de cortisol.';

  @override
  String get eduContent014 =>
      'Tu microbioma intestinal tiene una línea directa con tu respuesta al estrés — el eje intestino-cerebro:\n\n🦠 **Las bacterias intestinales producen neurotransmisores**: el 90% de la serotonina se produce en el intestino. Una flora intestinal desequilibrada significa menos serotonina.\n\n🔗 **El nervio vago** conecta el intestino con el cerebro — la inflamación intestinal activa directamente el eje HPA.\n\n🥛 **Los probióticos reducen el cortisol**: estudios muestran que los suplementos de Lactobacillus rhamnosus reducen la ansiedad y la respuesta de cortisol al estrés.\n\n**Alimentos para un microbioma saludable**:\n• Alimentos fermentados (kéfir, yogur, kimchi, chucrut)\n• Fibra prebiótica (ajo, cebolla, avena, plátanos)\n• Alimentos ricos en polifenoles (bayas, chocolate negro, té verde)';

  @override
  String get eduContent015 =>
      'El magnesio es a menudo llamado \"el tranquilizante de la naturaleza\" — y con razón:\n\n**La conexión con el cortisol**: el magnesio regula el eje HPA. La deficiencia permite que el cortisol funcione sin control, mientras que el magnesio adecuado frena la liberación excesiva.\n\n**La epidemia de deficiencia**: hasta el 68% de los estadounidenses tienen deficiencia de magnesio. El estrés crónico agota el magnesio — creando un círculo vicioso.\n\n**Señales de deficiencia**: ansiedad, tensión muscular, mal sueño, irritabilidad, dolores de cabeza, antojos de azúcar.\n\n**Principales fuentes alimentarias**: verduras de hoja verde oscura, semillas de calabaza, almendras, aguacate, chocolate negro, legumbres, granos integrales.\n\n**Suplementación**: el glicinato de magnesio y el treonato de magnesio tienen la mejor absorción.';

  @override
  String get eduContent016 =>
      'Escribir sobre tus emociones está clínicamente probado que reduce el cortisol:\n\n📝 **La escritura expresiva** (escribir sobre experiencias estresantes) reduce la respuesta de cortisol en situaciones posteriores de estrés\n\n🧠 **Por qué funciona**: escribir activa la corteza prefrontal (cerebro racional), que puede regular la amígdala (cerebro emocional) — cerrando el grifo del cortisol\n\n💙 **El diario de gratitud** es particularmente poderoso: incluso una breve escritura diaria de gratitud reduce el cortisol un 23% (investigación de UCDavis)\n\n**Cómo empezar**: solo 15 minutos, 3 días por semana. No edites, solo escribe. Enfócate tanto en lo que pasó como en cómo te sentiste al respecto.\n\nLa función de diario de esta app está diseñada exactamente para este propósito.';

  @override
  String get nutFilterAll => 'Todo';

  @override
  String get nutFilterFruits => 'Frutas';

  @override
  String get nutFilterVegetables => 'Verduras';

  @override
  String get nutFilterProteins => 'Proteínas';

  @override
  String get nutFilterBeverages => 'Bebidas';

  @override
  String get nutFilterNutsSeeds => 'Frutos secos';

  @override
  String get nutFilterGrains => 'Cereales';

  @override
  String get nutFilterDairy => 'Lácteos';

  @override
  String get nutFilterSpices => 'Especias';

  @override
  String get nutCatFruits => 'Frutas';

  @override
  String get nutCatVegetables => 'Verduras';

  @override
  String get nutCatProteins => 'Proteínas';

  @override
  String get nutCatBeverages => 'Bebidas';

  @override
  String get nutCatNutsSeeds => 'Frutos secos';

  @override
  String get nutCatGrains => 'Cereales';

  @override
  String get nutCatDairy => 'Lácteos';

  @override
  String get nutCatSpices => 'Especias';

  @override
  String get foodName000 => 'Arándanos';

  @override
  String get foodBenefit000 =>
      'Potentes antioxidantes reducen el estrés oxidativo';

  @override
  String get foodMechanism000 =>
      'Ricos en antocianinas que cruzan la barrera hematoencefálica, reduciendo la neuroinflamación y el daño oxidativo inducido por el cortisol. Los estudios muestran que el extracto de arándano reduce la respuesta al cortisol tras el estrés agudo.';

  @override
  String get foodServing000 =>
      'Añade un puñado a la avena nocturna o mezcla en un batido';

  @override
  String get foodNutrients000 => 'Vitamin C, Anthocyanins, Fiber, Vitamin K';

  @override
  String get foodName001 => 'Plátanos';

  @override
  String get foodBenefit001 =>
      'El potasio reduce la presión arterial; el triptófano aumenta la serotonina';

  @override
  String get foodMechanism001 =>
      'Los plátanos contienen triptófano, precursor de la serotonina — el neurotransmisor calmante que modula el cortisol. El potasio contrarresta el efecto del cortisol sobre la presión arterial. Los azúcares naturales proporcionan energía rápida sin un pico de cortisol.';

  @override
  String get foodServing001 =>
      'Córtalo sobre una tostada con mantequilla de almendra para un snack perfecto antiestrés';

  @override
  String get foodNutrients001 => 'Potassium, Tryptophan, Vitamin B6, Magnesium';

  @override
  String get foodName002 => 'Naranjas';

  @override
  String get foodBenefit002 =>
      'Alto contenido en vitamina C reduce directamente el cortisol';

  @override
  String get foodMechanism002 =>
      'Las glándulas suprarrenales consumen vitamina C rápidamente durante la producción de cortisol. Suplementar con vitamina C reduce la respuesta al cortisol ante factores estresantes psicológicos. Un estudio alemán de 2001 encontró que 1000 mg de vitamina C redujeron el cortisol y la presión arterial durante pruebas de hablar en público.';

  @override
  String get foodServing002 =>
      'Come la fruta entera (no zumo) para el beneficio de la fibra; tómala antes de eventos estresantes';

  @override
  String get foodNutrients002 => 'Vitamin C, Folate, Potassium, Flavonoids';

  @override
  String get foodName003 => 'Aguacates';

  @override
  String get foodBenefit003 =>
      'Las grasas saludables reducen la inflamación por estrés';

  @override
  String get foodMechanism003 =>
      'Los aguacates son ricos en grasas monoinsaturadas que apoyan la salud suprarrenal y reducen las citocinas inflamatorias vinculadas a la activación del eje HPA. Las vitaminas B (B5, B6) apoyan la producción de hormonas suprarrenales. El magnesio modula directamente el eje HPA.';

  @override
  String get foodServing003 =>
      'Pon aguacate en rodajas sobre salmón o huevos; añade a batidos para cremosidad';

  @override
  String get foodNutrients003 =>
      'Magnesium, B5 (Pantothenic Acid), B6, Monounsaturated Fats, Potassium';

  @override
  String get foodName004 => 'Espinacas';

  @override
  String get foodBenefit004 =>
      'Rica en magnesio — el tranquilizante de la naturaleza';

  @override
  String get foodMechanism004 =>
      'Las espinacas son una de las fuentes alimentarias más ricas en magnesio, que regula el eje HPA e inhibe la liberación excesiva de cortisol. La deficiencia de magnesio está directamente relacionada con el cortisol elevado. El folato en las espinacas también apoya la producción de GABA — el neurotransmisor calmante del cerebro.';

  @override
  String get foodServing004 =>
      'Saltea con ajo como guarnición o mezcla cruda en batidos matutinos (el sabor queda enmascarado)';

  @override
  String get foodNutrients004 =>
      'Magnesium, Folate, Iron, Vitamin K, Vitamin C';

  @override
  String get foodName005 => 'Batatas';

  @override
  String get foodBenefit005 =>
      'La energía sostenida previene los picos de cortisol por caídas del azúcar en sangre';

  @override
  String get foodMechanism005 =>
      'Las batatas proporcionan carbohidratos complejos de liberación lenta que previenen las caídas del azúcar en sangre que desencadenan la liberación de cortisol. Las variedades moradas son especialmente ricas en antocianinas. El alto contenido de potasio ayuda a contrarrestar los efectos del cortisol sobre la presión arterial.';

  @override
  String get foodServing005 =>
      'Ásalas con aceite de oliva y canela; machácalas como guarnición o base para Buddha bowls';

  @override
  String get foodNutrients005 =>
      'Potassium, Vitamin A, Fiber, Vitamin C, Manganese';

  @override
  String get foodName006 => 'Brócoli';

  @override
  String get foodBenefit006 =>
      'El sulforafano protege contra el daño cerebral inducido por el estrés';

  @override
  String get foodMechanism006 =>
      'El sulforafano del brócoli activa el Nrf2 — el interruptor maestro antioxidante del cuerpo — protegiendo las neuronas del estrés oxidativo inducido por el cortisol. El brócoli también es rico en vitamina C, magnesio y folato, todos moduladores directos del cortisol.';

  @override
  String get foodServing006 =>
      'Cocina al vapor ligeramente para preservar el sulforafano; rocía con limón y aceite de oliva';

  @override
  String get foodNutrients006 =>
      'Sulforaphane, Vitamin C, Folate, Calcium, Fiber';

  @override
  String get foodName007 => 'Salmón';

  @override
  String get foodBenefit007 =>
      'Las grasas omega-3 suprimen directamente la producción de cortisol';

  @override
  String get foodMechanism007 =>
      'El EPA y el DHA (ácidos grasos omega-3) del salmón reducen el cortisol de dos maneras: disminuyen la liberación hipotalámica de CRH y reducen la neuroinflamación que amplifica las respuestas al estrés. Los estudios muestran que el consumo regular de omega-3 reduce la reactividad al cortisol hasta un 22%.';

  @override
  String get foodServing007 =>
      'Hornea con limón y hierbas 2-3 veces por semana; combina con verduras de hoja y aguacate';

  @override
  String get foodNutrients007 =>
      'EPA/DHA Omega-3, Vitamin D, B12, Selenium, Protein';

  @override
  String get foodName008 => 'Pavo';

  @override
  String get foodBenefit008 =>
      'El triptófano eleva la serotonina para amortiguar el estrés';

  @override
  String get foodMechanism008 =>
      'El pavo es excepcionalmente rico en triptófano, que el cuerpo convierte en serotonina y melatonina. La serotonina modula la liberación de cortisol y promueve la regulación emocional. Las vitaminas B del pavo también apoyan la función suprarrenal.';

  @override
  String get foodServing008 =>
      'Córtalo en wraps con aguacate y espinacas; añade a ensaladas como proteína magra';

  @override
  String get foodNutrients008 => 'Tryptophan, B3 (Niacin), B6, Selenium, Zinc';

  @override
  String get foodName009 => 'Huevos';

  @override
  String get foodBenefit009 =>
      'La proteína completa con colina apoya la respuesta cerebral al estrés';

  @override
  String get foodMechanism009 =>
      'Los huevos contienen colina, esencial para la producción de acetilcolina — el neurotransmisor que regula el sistema nervioso parasimpático (de reposo). Se ha demostrado que la fosfatidilserina en las yemas de huevo reduce la respuesta al cortisol ante el ejercicio hasta un 30%.';

  @override
  String get foodServing009 =>
      'Revuelve con espinacas y cúrcuma; cuece para snacks portátiles';

  @override
  String get foodNutrients009 =>
      'Choline, Phosphatidylserine, B12, Vitamin D, Tryptophan';

  @override
  String get foodName010 => 'Té verde';

  @override
  String get foodBenefit010 =>
      'La L-teanina promueve la alerta tranquila sin pico de cortisol';

  @override
  String get foodMechanism010 =>
      'La L-teanina, exclusiva de las hojas de té, aumenta las ondas cerebrales alfa (asociadas con el enfoque relajado) y promueve la producción de GABA. Contrarresta el efecto elevador de cortisol de la cafeína, reduciendo la respuesta al estrés mientras mantiene la claridad mental.';

  @override
  String get foodServing010 =>
      'Bebe 2-3 tazas al día; prepara a 80°C (sin hervir) para preservar la L-teanina';

  @override
  String get foodNutrients010 =>
      'L-theanine, EGCG (catechins), Caffeine (low), Antioxidants';

  @override
  String get foodName011 => 'Té de manzanilla';

  @override
  String get foodBenefit011 =>
      'La apigenina se une a los receptores GABA para reducir la ansiedad';

  @override
  String get foodMechanism011 =>
      'La manzanilla contiene apigenina, un flavonoide que se une a los receptores GABA en el cerebro — los mismos receptores que se dirigen a los medicamentos ansiolíticos, pero con un efecto suave y natural. El consumo regular reduce los niveles de cortisol y mejora la calidad del sueño.';

  @override
  String get foodServing011 =>
      'Bebe 1-2 tazas antes de dormir como parte de un ritual de relajación';

  @override
  String get foodNutrients011 =>
      'Apigenin, Bisabolol, Chamazulene, Antioxidants';

  @override
  String get foodName012 => 'Almendras';

  @override
  String get foodBenefit012 =>
      'Magnesio + vitamina E protegen contra el daño por estrés';

  @override
  String get foodMechanism012 =>
      'Las almendras aportan el 20% del magnesio diario por onza — amortiguando directamente la sobreactividad del eje HPA. La vitamina E es un antioxidante que protege las células suprarrenales del daño de los radicales libres causado por la producción crónica de cortisol.';

  @override
  String get foodServing012 =>
      'Un pequeño puñado (23 almendras) como snack a media mañana; añade a la avena';

  @override
  String get foodNutrients012 =>
      'Magnesium, Vitamin E, Monounsaturated Fats, Protein, Fiber';

  @override
  String get foodName013 => 'Semillas de calabaza';

  @override
  String get foodBenefit013 =>
      'La deficiencia de zinc está relacionada con el cortisol alto — las semillas de calabaza son la fuente más rica';

  @override
  String get foodMechanism013 =>
      'El zinc es un cofactor crítico en el circuito de retroalimentación negativa que detiene la producción de cortisol. La deficiencia de zinc conduce a un cortisol crónicamente elevado. Las semillas de calabaza son la fuente vegetal más rica en zinc, además de contener triptófano y magnesio.';

  @override
  String get foodServing013 =>
      'Tuesta y añade a ensaladas, sopas o mezcla de frutos secos; mezcla en la avena';

  @override
  String get foodNutrients013 =>
      'Zinc, Tryptophan, Magnesium, Phosphorus, Manganese';

  @override
  String get foodName014 => 'Avena';

  @override
  String get foodBenefit014 =>
      'Los carbohidratos complejos estabilizan el azúcar en sangre y elevan la serotonina';

  @override
  String get foodMechanism014 =>
      'La avena proporciona carbohidratos complejos que desencadenan la producción de serotonina (los carbohidratos aumentan la absorción de triptófano en el cerebro). La fibra de beta-glucano promueve un microbioma intestinal saludable, que apoya el eje intestino-cerebro para la regulación del cortisol. Previenen las caídas del azúcar en sangre que desencadenan el cortisol.';

  @override
  String get foodServing014 =>
      'Prepara avena nocturna con arándanos, nueces y miel la noche anterior';

  @override
  String get foodNutrients014 =>
      'Beta-glucan, B1 (Thiamine), Magnesium, Zinc, Fiber';

  @override
  String get foodName015 => 'Quinoa';

  @override
  String get foodBenefit015 =>
      'Proteína completa con todos los aminoácidos esenciales para la producción de neurotransmisores';

  @override
  String get foodMechanism015 =>
      'La quinoa es una proteína completa que contiene los 9 aminoácidos esenciales, incluidos el triptófano y la tirosina — precursores de la serotonina y la dopamina respectivamente. Su bajo índice glucémico previene las fluctuaciones del azúcar en sangre que desencadenan la liberación de cortisol.';

  @override
  String get foodServing015 =>
      'Úsala como base para Buddha bowls o ensaladas mediterráneas';

  @override
  String get foodNutrients015 =>
      'Complete Protein, Magnesium, Iron, Fiber, Riboflavin';

  @override
  String get foodName016 => 'Yogur griego';

  @override
  String get foodBenefit016 =>
      'Los probióticos apoyan el eje intestino-cerebro para la regulación del cortisol';

  @override
  String get foodMechanism016 =>
      'El yogur griego es rico en cepas de Lactobacillus y Bifidobacterium que producen GABA directamente en el intestino. La investigación muestra que la suplementación con probióticos reduce el cortisol y la ansiedad en estudios clínicos. El alto contenido proteico apoya la saciedad y el azúcar en sangre estable.';

  @override
  String get foodServing016 =>
      'Cúbrelo con arándanos y semillas de calabaza para un desayuno completo antiestrés';

  @override
  String get foodNutrients016 =>
      'Probiotics, Protein, Calcium, B12, Tryptophan';

  @override
  String get foodName017 => 'Kéfir';

  @override
  String get foodBenefit017 =>
      'El alimento más denso en probióticos — reduce directamente el cortisol a través del eje intestinal';

  @override
  String get foodMechanism017 =>
      'El kéfir contiene hasta 61 cepas de bacterias beneficiosas — mucho más que el yogur. Los estudios muestran que el consumo de kéfir reduce el cortisol al modular la conexión microbioma intestinal-cerebro. El contenido de triptófano también aumenta la serotonina.';

  @override
  String get foodServing017 =>
      'Bebe solo o mezcla en batidos; úsalo como base para smoothie bowls';

  @override
  String get foodNutrients017 =>
      'Probiotics (61 strains), Tryptophan, Calcium, B12, K2';

  @override
  String get foodName018 => 'Cúrcuma';

  @override
  String get foodBenefit018 =>
      'La curcumina es tan efectiva como los antidepresivos en múltiples ensayos';

  @override
  String get foodMechanism018 =>
      'La curcumina de la cúrcuma inhibe las citocinas inflamatorias (IL-6, TNF-alfa) que activan el eje HPA. También eleva el BDNF (factor neurotrófico derivado del cerebro), protegiendo las neuronas del daño del cortisol. Múltiples ensayos muestran que la curcumina reduce el cortisol y la depresión tan eficazmente como algunos fármacos.';

  @override
  String get foodServing018 =>
      'Leche dorada antes de dormir: leche caliente + cúrcuma + pimienta negra + miel';

  @override
  String get foodNutrients018 =>
      'Curcumin, Iron, Manganese, Anti-inflammatory compounds';

  @override
  String get foodName019 => 'Chocolate negro (70%+)';

  @override
  String get foodBenefit019 =>
      'Reduce directamente el cortisol y la adrenalina — demostrado en ensayos clínicos';

  @override
  String get foodMechanism019 =>
      'Un estudio pionero de 2009 encontró que comer 40 g de chocolate negro diariamente durante 2 semanas redujo el cortisol y las catecolaminas en cantidades significativas. El contenido de magnesio modula el eje HPA; los flavanoles aumentan el BDNF y protegen contra el daño neuronal inducido por el estrés. La teobromina proporciona energía calmante.';

  @override
  String get foodServing019 =>
      '1-2 onzas (40 g) después del almuerzo; busca un contenido de cacao del 70%+';

  @override
  String get foodNutrients019 =>
      'Magnesium, Flavanols, Theobromine, Iron, Zinc';

  @override
  String get breathTechBelly => 'Respiración abdominal';

  @override
  String get breathTechBox => 'Respiración cuadrada';

  @override
  String get breathTech478 => 'Respiración 4-7-8';

  @override
  String get breathDescBelly =>
      'La base de toda técnica de respiración. También llamada respiración diafragmática, activa inmediatamente el sistema nervioso parasimpático. Perfecta para principiantes o cualquiera que necesite un reinicio rápido del estrés.';

  @override
  String get breathDescBox =>
      'Utilizada por los Navy SEALs y atletas de élite para mantener la calma bajo presión extrema. Las fases de igual duración crean un patrón de \"caja\" que reinicia rápidamente el sistema nervioso. Excelente para el enfoque.';

  @override
  String get breathDesc478 =>
      'Desarrollada por el Dr. Andrew Weil basada en tradiciones de pranayama yóguico. La exhalación prolongada (8 tiempos) activa el freno vagal sobre la respuesta al estrés. El Dr. Weil la llama \"un tranquilizante natural para el sistema nervioso\".';

  @override
  String get breathInstrBellyInhale =>
      'Inhala lentamente por la nariz, llenando tu abdomen';

  @override
  String get breathInstrBellyExhale =>
      'Exhala lentamente por la boca, vaciando tu abdomen';

  @override
  String get breathInstrBoxInhale =>
      'Inhala lentamente por la nariz, contando hasta 4';

  @override
  String get breathInstrBoxHoldFull =>
      'Mantén suavemente — pulmones llenos, cuerpo relajado';

  @override
  String get breathInstrBoxExhale =>
      'Exhala completamente por la boca, contando hasta 4';

  @override
  String get breathInstrBoxHoldEmpty =>
      'Mantén suavemente — pulmones vacíos, cuerpo relajado';

  @override
  String get breathInstr478Inhale =>
      'Inhala silenciosamente por la nariz durante 4 tiempos';

  @override
  String get breathInstr478Hold =>
      'Mantén la respiración completamente durante 7 tiempos';

  @override
  String get breathInstr478Exhale =>
      'Exhala completamente por la boca con un sonido sibilante durante 8 tiempos';

  @override
  String get breathBenefitBelly1 => 'Activa el sistema nervioso parasimpático';

  @override
  String get breathBenefitBelly2 => 'Reduce el cortisol en minutos';

  @override
  String get breathBenefitBelly3 =>
      'Reduce la frecuencia cardíaca y la presión arterial';

  @override
  String get breathBenefitBelly4 => 'Mejora el intercambio de oxígeno';

  @override
  String get breathBenefitBox1 => 'Reducción rápida del estrés y la ansiedad';

  @override
  String get breathBenefitBox2 => 'Mejora el enfoque y la concentración';

  @override
  String get breathBenefitBox3 => 'Usado por Navy SEALs y atletas de élite';

  @override
  String get breathBenefitBox4 => 'Equilibra los niveles de CO2 y O2';

  @override
  String get breathBenefitBox5 => 'Reduce la respuesta de cortisol';

  @override
  String get breathBenefit4781 => 'Efecto tranquilizante natural';

  @override
  String get breathBenefit4782 => 'Reduce la ansiedad aguda en minutos';

  @override
  String get breathBenefit4783 => 'Activa el nervio vago';

  @override
  String get breathBenefit4784 =>
      'Ayuda con el insomnio — hazlo antes de dormir';

  @override
  String get breathBenefit4785 => 'Controla los antojos de comida por estrés';

  @override
  String get breathBenefit4786 => 'Basado en pranayama yóguico ancestral';

  @override
  String get durationMin => 'min';

  @override
  String get durationSec => 'seg';

  @override
  String get appBlockerSubtitle =>
      'Bloquea aplicaciones estresantes durante tu rutina matutina';

  @override
  String get compEducation => 'Módulo educativo';

  @override
  String get compBreathing => 'Ejercicios de respiración (3)';

  @override
  String get compSoundscapes => 'Paisajes sonoros (5)';

  @override
  String get compNutrition => 'Guía nutricional';

  @override
  String get compJournal => 'Diario de ánimo';

  @override
  String get compSleep => 'Seguimiento del sueño';

  @override
  String get compMeditation => 'Biblioteca de meditaciones guiadas';

  @override
  String get compRecipes => 'Libro de recetas (22 recetas)';

  @override
  String get compAppBlocker => 'Bloqueador de apps / Modo enfoque';

  @override
  String get compAiInsights => 'Análisis de ánimo con IA';

  @override
  String get compWeeklyAnalysis => 'Análisis de patrones semanales';

  @override
  String get blockerHeroText =>
      'Las primeras 2 horas después de despertar tienen los niveles más altos de cortisol. Evitar apps estresantes (redes sociales, noticias) mejora drásticamente tu día.';

  @override
  String blockerActiveStatus(Object hours) {
    return 'Activo — ${hours}h después de despertar';
  }

  @override
  String get blockerInactive => 'Inactivo';

  @override
  String blockerDurationLabel(Object hours) {
    return 'Duración del bloqueo: $hours horas';
  }

  @override
  String get thisWeek => 'Esta semana';

  @override
  String get sevenDayAverage => 'Promedio de 7 días';

  @override
  String get vsLastWeek => 'vs semana pasada';

  @override
  String get stressLow => 'Bajo';

  @override
  String get stressModerate => 'Moderado';

  @override
  String get stressHigh => 'Alto';

  @override
  String get dayMon => 'Lun';

  @override
  String get dayTue => 'Mar';

  @override
  String get dayWed => 'Mié';

  @override
  String get dayThu => 'Jue';

  @override
  String get dayFri => 'Vie';

  @override
  String get daySat => 'Sáb';

  @override
  String get daySun => 'Dom';

  @override
  String get moodPattern1obs => 'Tu ánimo tiende a bajar los miércoles';

  @override
  String get moodPattern1tip =>
      'Considera programar una sesión de respiración de 5 minutos los miércoles por la mañana para anticipar el pico de estrés.';

  @override
  String get moodPattern2obs =>
      'Consistentemente te sientes mejor los viernes y fines de semana';

  @override
  String get moodPattern2tip =>
      'Esto sugiere que el estrés laboral es el principal factor. El bloqueador de apps y la rutina de respiración matutina pueden ayudar.';

  @override
  String get moodPattern3obs =>
      'El ánimo más bajo se correlaciona con noches de menos de 7 horas de sueño';

  @override
  String get moodPattern3tip =>
      'Establecer una hora de acostarse constante a las 10:30 PM y usar la receta de Latte de Manzanilla podría mejorar tu ánimo base.';

  @override
  String get weeklyTipText =>
      'Según tus patrones de ánimo, tu cortisol probablemente es más alto los martes y miércoles por la mañana. Prueba el ejercicio de respiración 4-7-8 antes de tu primera tarea esos días. Tus entradas del diario sugieren mejor ánimo cuando haces ejercicio — considera 20 minutos de movimiento moderado antes de las 10 AM.';

  @override
  String playingMeditation(Object title) {
    return 'Reproduciendo: $title';
  }

  @override
  String get medTitle1 => 'Reinicio matutino de cortisol';

  @override
  String get medDesc1 =>
      'Comienza tu día regulando tu respuesta de cortisol al despertar.';

  @override
  String get medCat1 => 'Mañana';

  @override
  String get medTitle2 => 'Preparación para dormir';

  @override
  String get medDesc2 =>
      'Relaja tu sistema nervioso para un sueño profundo y reparador.';

  @override
  String get medCat2 => 'Sueño';

  @override
  String get medTitle3 => 'Alivio de la ansiedad';

  @override
  String get medDesc3 =>
      'Interrumpe el ciclo de respuesta al estrés con técnicas MBSR.';

  @override
  String get medCat3 => 'Ansiedad';

  @override
  String get medTitle4 => 'Enfoque profundo';

  @override
  String get medDesc4 =>
      'Reduce el cortisol mientras entras en un estado de productividad tranquila.';

  @override
  String get medCat4 => 'Enfoque';

  @override
  String get medTitle5 => 'Escaneo corporal';

  @override
  String get medDesc5 =>
      'Libera la tensión física acumulada por el estrés crónico.';

  @override
  String get medCat5 => 'Cuerpo';

  @override
  String get filterBreakfast => 'Desayuno';

  @override
  String get filterSmoothies => 'Batidos';

  @override
  String get filterSalads => 'Ensaladas';

  @override
  String get filterMains => 'Principales';

  @override
  String get filterSnacks => 'Snacks';

  @override
  String get filterDrinks => 'Bebidas';

  @override
  String get filterDesserts => 'Postres';

  @override
  String get moreJournalSub => 'Registra tu estado de ánimo diario';

  @override
  String get moreSleepSub => 'Monitorea la calidad de tu sueño';

  @override
  String get moreSettingsSub => 'Tema, idioma, notificaciones';

  @override
  String unlockProButton(Object price) {
    return 'Desbloquear PRO — $price';
  }

  @override
  String get paymentDisclaimer =>
      'Pago procesado por Google Play. Compra única. Sin suscripción.';

  @override
  String get proThankYouSnackbar =>
      '¡Gracias! Todas las funciones PRO están desbloqueadas.';

  @override
  String get cortisolZeroPro => 'Cortisol Zero PRO';

  @override
  String get proBannerDescription =>
      'Recetas, meditación, bloqueador de apps, análisis IA — \$6.50 pago único';

  @override
  String get aiDemoDataNotice =>
      'Esta es una vista previa de demostración. Comienza a registrar tu estado de ánimo diario para ver información personalizada de IA.';

  @override
  String get aiDemoLabel => 'Datos demo';

  @override
  String get recipeWhyItWorks => 'Por qué funciona';

  @override
  String get recipeIngredients => 'Ingredientes';

  @override
  String get recipeInstructions => 'Instrucciones';

  @override
  String recipeServings(int count) {
    return '$count porciones';
  }

  @override
  String get blockedAppsTitle => 'Apps bloqueadas';

  @override
  String get blockerAddApps => 'Añadir';

  @override
  String get blockerNoAppsSelected =>
      'No hay apps seleccionadas. Toca Añadir para elegir qué apps bloquear durante tu enfoque matutino.';

  @override
  String get blockerSelectApps => 'Seleccionar apps para bloquear';

  @override
  String get blockerSearchApps => 'Buscar apps...';

  @override
  String get blockerLoadingApps => 'Cargando apps instaladas...';

  @override
  String get blockerStartButton => 'Iniciar bloqueo';

  @override
  String get blockerStopButton => 'Detener bloqueo';

  @override
  String get blockerPermUsageStats => 'Acceso a datos de uso';

  @override
  String get blockerPermOverlay => 'Mostrar sobre otras apps';

  @override
  String get blockerRefreshPerms => 'Actualizar permisos';

  @override
  String get proActivatedMessage =>
      'Todas las funciones PRO están desbloqueadas y se activarán en unos segundos.';

  @override
  String get permOnboardingTitle => 'Configurar permisos';

  @override
  String get permStepUsageTitle => 'Acceso a datos de uso';

  @override
  String get permStepUsageDesc =>
      'Permítenos ver cuándo abres una fuente de estrés. Esto es necesario para activar el bloqueador.';

  @override
  String get permStepUsageButton => 'Abrir ajustes de uso';

  @override
  String get permStepOverlayTitle => 'Mostrar sobre otras apps';

  @override
  String get permStepOverlayDesc =>
      'Permítenos cubrir la fuente de estrés. Esto nos permitirá mostrar una pantalla tranquila en lugar de la app bloqueada.';

  @override
  String get permStepOverlayButton => 'Abrir ajustes de superposición';

  @override
  String get permStepGranted => 'Permiso concedido';

  @override
  String get permNextStep => 'Siguiente paso';

  @override
  String get permAllDone => '¡Todo listo — vamos!';

  @override
  String get permBackToStep1 => 'Volver al paso 1';

  @override
  String get permStepUsageLottieHint =>
      'Busca Cortisol Zero en la lista y habilita el acceso';

  @override
  String get permStepOverlayLottieHint =>
      'Activa el interruptor para permitir la superposición';

  @override
  String get permSetupRequired => 'Configuración necesaria';

  @override
  String get permSetupRequiredDesc =>
      'Para bloquear apps, necesitamos tres permisos. Toca abajo para configurarlos.';

  @override
  String get permStepAccessibilityTitle => 'Servicio de accesibilidad';

  @override
  String get permStepAccessibilityDesc =>
      'Cortisol Zero usa el Servicio de Accesibilidad de Android únicamente para detectar qué app está en pantalla (por nombre de paquete). NO accede a mensajes, contraseñas, datos financieros ni información personal. Todo el procesamiento ocurre localmente en tu dispositivo y nunca se almacena ni transmite.';

  @override
  String get permStepAccessibilityButton => 'Abrir ajustes de accesibilidad';

  @override
  String get permStepAccessibilityLottieHint =>
      'Encuentra Cortisol Zero en la lista de apps instaladas y actívalo';

  @override
  String get blockerPermAccessibility => 'Servicio de accesibilidad';

  @override
  String get permBackToStep2 => 'Volver al paso 2';

  @override
  String get permDisclosureAccesses => 'A qué accede';

  @override
  String get permDisclosureAccessesDesc =>
      'Cuál aplicación está actualmente en pantalla (solo nombre del paquete)';

  @override
  String get permDisclosureNotAccesses => 'A qué NO accede';

  @override
  String get permDisclosureNotAccessesDesc =>
      'Mensajes, contraseñas, datos financieros, información personal, historial de navegación, contactos';

  @override
  String get permDisclosureDataUsage => 'Cómo se usan los datos';

  @override
  String get permDisclosureDataUsageDesc =>
      'Toda la detección es local en su dispositivo. Nada se almacena ni transmite.';

  @override
  String get permUnderstandContinue => 'Entiendo y continuar';

  @override
  String get moodInsights3DayTitle => 'Perspectivas rápidas de 3 días';

  @override
  String get moodInsightsWeeklyTitle => 'Análisis de patrones semanales';

  @override
  String get moodInsightsRetry => 'Reintentar análisis';

  @override
  String get moodInsightsError =>
      'El análisis falló. Por favor, inténtalo de nuevo.';

  @override
  String get moodInsightsNotEnoughData =>
      'Añade al menos 2 registros de estado de ánimo para ver perspectivas';

  @override
  String get privacyOverviewTitle => 'Cómo manejamos sus datos';

  @override
  String get privacyOverviewBody =>
      'Cortisol Zero necesita 3 permisos para bloquear aplicaciones de estrés. Todo el procesamiento ocurre localmente en su dispositivo. NO recopilamos, almacenamos ni enviamos datos a servidores. NO tenemos cuentas de usuario ni analíticas.';

  @override
  String get privacyOverviewAccept => 'Acepto y continuar';

  @override
  String get privacyOverviewLearnMore => 'Política de privacidad';

  @override
  String get privacyOverviewTerms => 'Términos de servicio';

  @override
  String get permTutorialButton => 'Ver tutorial en video';

  @override
  String get permTapToGrant => 'TOCA PARA CONCEDER';

  @override
  String get permFindAppText =>
      'Encuentra Cortisol Zero en la siguiente pantalla';

  @override
  String get permTapAndToggle => 'Tócalo y activa el interruptor';

  @override
  String get permWhatItDoes => 'Qué hace este permiso';

  @override
  String get permWhatItDoesNot => 'Qué NO hace este permiso';

  @override
  String get legalSectionTitle => 'Legal';

  @override
  String get legalPrivacyPolicy => 'Política de privacidad';

  @override
  String get legalTermsOfService => 'Términos de servicio';

  @override
  String get todaysMoodRecorded => 'Estado de ánimo de hoy: registrado';

  @override
  String blockerScheduleInfo(String time, String hours) {
    return 'Bloqueo programado desde $time durante ${hours}h al día. El bloqueo terminará automáticamente.';
  }

  @override
  String get privacyPolicyTitle => 'Política de privacidad';

  @override
  String get privacyPolicyLastUpdated =>
      'Fecha de entrada en vigor: 1 de enero de 2025';

  @override
  String get privacyPolicyIntro =>
      'Cortisol Zero (\"nosotros\", \"nuestro\", \"aplicación\") se compromete a proteger su privacidad.';

  @override
  String get privacyPolicyDataCollectedTitle => '1. Datos que recopilamos';

  @override
  String get privacyPolicyDataCollectedBody =>
      'Cortisol Zero NO recopila ningún dato personal. Todos los datos (entradas del diario, registros de sueño, historial de sesiones de respiración y horarios del bloqueador de aplicaciones) se almacenan exclusivamente en su dispositivo y nunca se transmiten a ningún servidor.';

  @override
  String get privacyPolicyPermissionsTitle => '2. Permisos utilizados';

  @override
  String get privacyPolicyPermissionsBody =>
      '• Servicio de accesibilidad — detecta qué aplicación está en pantalla (solo el nombre del paquete) para aplicar su horario de bloqueo. NO lee sus mensajes, contraseñas ni datos personales.\n\n• Mostrar sobre otras aplicaciones — muestra una pantalla de superposición tranquilizadora cuando se abre una aplicación bloqueada durante las horas de enfoque.\n\n• Estadísticas de uso — lee los datos de uso de aplicaciones para activar las reglas de bloqueo. Estos datos permanecen solo en su dispositivo.\n\n• Servicio en primer plano — mantiene el bloqueador activo en segundo plano durante su ventana de enfoque programada.\n\nNinguno de estos permisos se utiliza para recopilar, transmitir o compartir datos con nosotros ni con terceros.';

  @override
  String get privacyPolicyPurchasesTitle =>
      '3. Compras dentro de la aplicación';

  @override
  String get privacyPolicyPurchasesBody =>
      'Las compras son procesadas por Google Play. No almacenamos información de pago. Solo recibimos un token de compra para verificar su estado PRO.';

  @override
  String get privacyPolicyThirdPartyTitle => '4. Servicios de terceros';

  @override
  String get privacyPolicyThirdPartyBody =>
      'No integramos servicios de analítica, SDK de publicidad ni informes de fallos que recopilen datos personales. La aplicación no contiene código de seguimiento.';

  @override
  String get privacyPolicyChildrenTitle => '5. Niños';

  @override
  String get privacyPolicyChildrenBody =>
      'Cortisol Zero no recopila conscientemente información de menores de 13 años. La aplicación está calificada para audiencias generales.';

  @override
  String get privacyPolicyContactTitle => '6. Contacto';

  @override
  String get privacyPolicyContactBody =>
      'Para consultas sobre privacidad, contáctenos en: cartizolzero@gmail.com';

  @override
  String get privacyPolicyChangesTitle => '7. Cambios';

  @override
  String get privacyPolicyChangesBody =>
      'Podemos actualizar esta política. El uso continuado de la aplicación tras las actualizaciones constituye la aceptación de la política revisada.';

  @override
  String get termsTitle => 'Términos de servicio';

  @override
  String get termsLastUpdated =>
      'Fecha de entrada en vigor: 1 de enero de 2025';

  @override
  String get termsIntro =>
      'Al utilizar Cortisol Zero, usted acepta estos términos.';

  @override
  String get termsUseTitle => '1. Uso de la aplicación';

  @override
  String get termsUseBody =>
      'Cortisol Zero es una herramienta personal de salud y productividad. Puede utilizarla para sus propios objetivos de gestión del estrés y concentración. No puede realizar ingeniería inversa, distribuir ni revender la aplicación ni su contenido.';

  @override
  String get termsProTitle => '2. Suscripción PRO';

  @override
  String get termsProBody =>
      'Las funciones PRO se desbloquean mediante una compra dentro de la aplicación procesada por Google Play. Las suscripciones se renuevan automáticamente a menos que se cancelen al menos 24 horas antes de la fecha de renovación. Los reembolsos se gestionan según la política de reembolsos de Google Play.';

  @override
  String get termsPermissionsTitle => '3. Permisos';

  @override
  String get termsPermissionsBody =>
      'La aplicación requiere ciertos permisos de Android (Servicio de accesibilidad, Mostrar sobre otras aplicaciones, Estadísticas de uso) para proporcionar la funcionalidad de bloqueo de aplicaciones. Estos permisos se utilizan únicamente para el propósito indicado y nunca para recopilar datos personales.';

  @override
  String get termsDisclaimerTitle => '4. Aviso legal';

  @override
  String get termsDisclaimerBody =>
      'Cortisol Zero es una herramienta de bienestar y NO es un dispositivo médico ni asesoramiento médico. Consulte siempre a un profesional de la salud para cuestiones médicas.';

  @override
  String get termsLiabilityTitle => '5. Limitación de responsabilidad';

  @override
  String get termsLiabilityBody =>
      'No somos responsables de ningún daño derivado del uso de esta aplicación. La aplicación se proporciona \"tal cual\" sin garantía de ningún tipo.';

  @override
  String get termsChangesTitle => '6. Cambios';

  @override
  String get termsChangesBody =>
      'Podemos actualizar estos términos. El uso continuado de la aplicación tras las actualizaciones constituye su aceptación.';

  @override
  String get termsContactTitle => '7. Contacto';

  @override
  String get termsContactBody =>
      'Para consultas, contáctenos en: cartizolzero@gmail.com';

  @override
  String get testAlarmIn1Min => 'Probar alarma en 1 minuto';

  @override
  String get testAlarmScheduled => 'Alarma de prueba programada en 1 minuto';

  @override
  String get blockerLockedTitle => 'Ajustes bloqueados';

  @override
  String blockerLockedBody(String time) {
    return 'El modo enfoque está activo. Podrás cambiar los ajustes cuando termine el bloqueo a las $time.';
  }
}
