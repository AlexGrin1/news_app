import 'package:news_app/imports.dart';
import 'package:news_app/logic/bloc/favourites_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  localData.initializeLocalData();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageControllProvider()),
        BlocProvider(
          create: (context) => FavoriteNewsCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        home: HomeScreen(),
      ),
    );
  }
}
