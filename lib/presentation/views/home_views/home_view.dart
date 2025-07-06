import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {

  
  @override
  void initState() {
    
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(top_ratedMoviesProvider.notifier).loadNextPage();
    

  }


  @override
  Widget build(BuildContext context) {
    //final nowPlayingMovies= ref.watch(nowPlayingMoviesProvider);
    //if(nowPlayingMovies.length==0)return CircularProgressIndicator();
    final initialLoading= ref.watch(initialLoadingProvider);
    if(initialLoading) return const FullScreenLoader();


    final slideShowMovies= ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies= ref.watch(nowPlayingMoviesProvider);
    final popularMovies= ref.watch(popularMoviesProvider);
    final upcomingMovies= ref.watch(upcomingMoviesProvider);
    final top_ratedMovies= ref.watch(top_ratedMoviesProvider);


    return CustomScrollView(
      slivers:[
        const SliverAppBar(
          floating: true,
          centerTitle: false,          
          title: CustomAppbar(),
          

        ),
        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return  Column(
        children: [
          //CustomAppbar(),
      
          MoviesSlideshow(
            movies: slideShowMovies),
            MovieHorizontalListview(
              movies: nowPlayingMovies,
              title: 'En Cines',
              subtitle: 'Hoy en día!',
              loadNextPage: ()=> ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()
              
              ),
              
            MovieHorizontalListview(
              movies: upcomingMovies,
              title: 'Proximamente',
              subtitle: 'Este mes!',
              loadNextPage: ()=> ref.read(upcomingMoviesProvider.notifier).loadNextPage()
              
              ),
              
            MovieHorizontalListview(
              movies: popularMovies,
              title: 'Populares',
              subtitle: 'Este Año!',
              loadNextPage: ()=> ref.read(popularMoviesProvider.notifier).loadNextPage()
              
              ),
              MovieHorizontalListview(
              movies: top_ratedMovies,
              title: 'Mejor calificadas',
              subtitle: 'Del 2025',
              loadNextPage: ()=> ref.read(top_ratedMoviesProvider.notifier).loadNextPage()
              
              ),
              SizedBox(height: 10,),
        ],
      );
          },
          childCount: 1,
        ))
      ]
    );
  }
}