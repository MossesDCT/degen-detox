import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../core/constants/app_strings.dart';
import '../core/utils/purchase_manager.dart';

// Education
import '../features/education/data/datasources/education_local_datasource.dart';
import '../features/education/data/repositories/education_repository_impl.dart';
import '../features/education/domain/repositories/education_repository.dart';
import '../features/education/domain/usecases/get_education_snippets.dart';
import '../features/education/presentation/bloc/education_bloc.dart';

// Nutrition
import '../features/nutrition/data/datasources/nutrition_local_datasource.dart';
import '../features/nutrition/data/repositories/nutrition_repository_impl.dart';
import '../features/nutrition/domain/repositories/nutrition_repository.dart';
import '../features/nutrition/domain/usecases/get_nutrition_guide.dart';
import '../features/nutrition/presentation/bloc/nutrition_bloc.dart';

// Breathing
import '../features/breathing/data/datasources/breathing_local_datasource.dart';
import '../features/breathing/data/repositories/breathing_repository_impl.dart';
import '../features/breathing/domain/repositories/breathing_repository.dart';
import '../features/breathing/domain/usecases/get_breathing_techniques.dart';
import '../features/breathing/presentation/bloc/breathing_bloc.dart';

// Journal
import '../features/journal/data/datasources/journal_local_datasource.dart';
import '../features/journal/data/repositories/journal_repository_impl.dart';
import '../features/journal/domain/repositories/journal_repository.dart';
import '../features/journal/domain/usecases/journal_usecases.dart';
import '../features/journal/presentation/bloc/journal_bloc.dart';

// Sleep Tracker
import '../features/sleep_tracker/presentation/bloc/sleep_bloc.dart';

// Purchase
import '../features/purchase/presentation/bloc/purchase_bloc.dart';

// PRO Recipes
import '../features/pro/recipes/data/datasources/recipe_local_datasource.dart';
import '../features/pro/recipes/data/repositories/recipe_repository_impl.dart';
import '../features/pro/recipes/domain/repositories/recipe_repository.dart';
import '../features/pro/recipes/domain/usecases/get_recipes.dart';
import '../features/pro/recipes/presentation/bloc/recipe_bloc.dart';

// PRO App Blocker
import '../features/pro/app_blocker/presentation/bloc/app_blocker_bloc.dart';

final GetIt sl = GetIt.instance;

/// Initializes all dependencies.
/// Call this before [runApp].
Future<void> initDependencies() async {
  // ── Core ──────────────────────────────────────────────────────────────────
  final prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);

  // Initialize SQLite database
  final db = await _initDatabase();
  sl.registerSingleton<Database>(db);

  // Purchase Manager singleton
  sl.registerSingleton<PurchaseManager>(PurchaseManager.instance);
  await PurchaseManager.instance.initialize();

  // ── Data Sources ──────────────────────────────────────────────────────────
  sl.registerLazySingleton<EducationLocalDatasource>(
      () => EducationLocalDatasource());
  sl.registerLazySingleton<NutritionLocalDatasource>(
      () => NutritionLocalDatasource());
  sl.registerLazySingleton<BreathingLocalDatasource>(
      () => BreathingLocalDatasource());
  sl.registerLazySingleton<JournalLocalDatasource>(
      () => JournalLocalDatasource(db: sl<Database>()));
  sl.registerLazySingleton<RecipeLocalDatasource>(
      () => RecipeLocalDatasource());

  // ── Repositories ──────────────────────────────────────────────────────────
  sl.registerLazySingleton<EducationRepository>(
      () => EducationRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<NutritionRepository>(
      () => NutritionRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<BreathingRepository>(
      () => BreathingRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<JournalRepository>(
      () => JournalRepositoryImpl(datasource: sl()));
  sl.registerLazySingleton<RecipeRepository>(
      () => RecipeRepositoryImpl(datasource: sl()));

  // ── Use Cases ─────────────────────────────────────────────────────────────
  sl.registerLazySingleton<GetEducationSnippets>(
      () => GetEducationSnippets(repository: sl()));
  sl.registerLazySingleton<GetNutritionGuide>(
      () => GetNutritionGuide(repository: sl()));
  sl.registerLazySingleton<GetBreathingTechniques>(
      () => GetBreathingTechniques(repository: sl()));
  sl.registerLazySingleton<GetJournalEntries>(
      () => GetJournalEntries(repository: sl()));
  sl.registerLazySingleton<AddJournalEntry>(
      () => AddJournalEntry(repository: sl()));
  sl.registerLazySingleton<UpdateJournalEntry>(
      () => UpdateJournalEntry(repository: sl()));
  sl.registerLazySingleton<DeleteJournalEntry>(
      () => DeleteJournalEntry(repository: sl()));
  sl.registerLazySingleton<GetRecipes>(() => GetRecipes(repository: sl()));

  // ── BLoCs (factory - new instance per page) ───────────────────────────────
  sl.registerFactory<EducationBloc>(() => EducationBloc(getSnippets: sl()));
  sl.registerFactory<NutritionBloc>(
      () => NutritionBloc(getNutritionGuide: sl()));
  sl.registerFactory<BreathingBloc>(() => BreathingBloc(getTechniques: sl()));
  sl.registerFactory<JournalBloc>(() => JournalBloc(
        getEntries: sl(),
        addEntry: sl(),
        updateEntry: sl(),
        deleteEntry: sl(),
      ));
  sl.registerFactory<SleepBloc>(() => SleepBloc(prefs: sl()));
  sl.registerFactory<PurchaseBloc>(() => PurchaseBloc(purchaseManager: sl()));
  sl.registerFactory<RecipeBloc>(() => RecipeBloc(getRecipes: sl()));
  sl.registerFactory<AppBlockerBloc>(() => AppBlockerBloc(prefs: sl()));
}

Future<Database> _initDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, AppStrings.dbName);

  return openDatabase(
    path,
    version: AppStrings.dbVersion,
    onCreate: (db, version) async {
      // Journal entries table
      await db.execute('''
        CREATE TABLE ${AppStrings.tableJournalEntries} (
          id TEXT PRIMARY KEY,
          mood INTEGER NOT NULL,
          note TEXT,
          date TEXT NOT NULL,
          tags TEXT
        )
      ''');

      // Sleep entries table
      await db.execute('''
        CREATE TABLE ${AppStrings.tableSleepEntries} (
          id TEXT PRIMARY KEY,
          quality INTEGER NOT NULL,
          duration_hours REAL NOT NULL,
          bedtime TEXT NOT NULL,
          wakeTime TEXT NOT NULL,
          notes TEXT,
          date TEXT NOT NULL
        )
      ''');
    },
  );
}
