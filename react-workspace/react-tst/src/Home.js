const Home = (props) => {
    console.log(props);
    const {movies , onDeleteMovie} = props;
    return(
        <div>
            <h1>Movies</h1>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Genre</th>
                        <th>Release Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    {                       
                        movies.map( (movie) => ( 
                            <tr key={movie.id}>
                                <td>{movie.id}</td>
                                <td>{movie.title}</td>
                                <td>{movie.genre}</td>
                                <td>{movie.release_date}</td>
                                <td>
                                    <button onClick={ () => onDeleteMovie(movie.id)  }>Delete</button>
                                </td>
                            </tr>)
                        )    
                    }
                </tbody>
            </table>
        </div>
    )
}
export default Home;