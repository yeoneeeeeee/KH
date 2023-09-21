const CreateMovie = (props) => {
    const {newMovie , onInputChange, onAddMovie} = props;
    return (
        <div>
            <h1>Create Movie</h1>
            <form>
                <input 
                    type="number"
                    name="id"
                    value={newMovie.id}// value값과 newMovie의 id값을 동기화. setNewMovie({...newMovie, ['id'] : ''})
                    onChange={onInputChange}// 이벤트핸들러추가. 현재 인풋태그의 값이 변경시 newMovie의 id에 현재태그의 value값이 추가됨
                    placeholder="Input movie id"
                />
                <br/>
                <input 
                    type="text"
                    name="title"
                    value={newMovie.title}// value값과 newMovie의 id값을 동기화. setNewMovie({...newMovie, ['id'] : ''})
                    onChange={onInputChange}// 이벤트핸들러추가. 현재 인풋태그의 값이 변경시 newMovie의 id에 현재태그의 value값이 추가됨
                    placeholder="Input movie title"
                />
                <br/>
                <input 
                    type="text"
                    name="genre"
                    value={newMovie.genre}// value값과 newMovie의 id값을 동기화. setNewMovie({...newMovie, ['id'] : ''})
                    onChange={onInputChange}// 이벤트핸들러추가. 현재 인풋태그의 값이 변경시 newMovie의 id에 현재태그의 value값이 추가됨
                    placeholder="Input movie genre"
                />
                <br/>
                <label>출시일 : </label>
                <input 
                    type="date"
                    name="release_date"
                    value={newMovie.release_date}// value값과 newMovie의 id값을 동기화. setNewMovie({...newMovie, ['id'] : ''})
                    onChange={onInputChange}// 이벤트핸들러추가. 현재 인풋태그의 값이 변경시 newMovie의 id에 현재태그의 value값이 추가됨                   
                />
            </form>
            <button onClick={onAddMovie}>Add Movie</button>
        </div>
    )
}

export default CreateMovie;