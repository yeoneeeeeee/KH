import './App.css';
import { BrowserRouter as Router, Link, Routes, Route } from 'react-router-dom';
import { useState } from 'react';
import Home from './Home';
import CreateMovie from './CreateMovie';

function App() {
  //영화 게시판의 기본데이터 + setter함수
  const [movies , setMovies] = useState([
    { id : 1, title : '오펜하이머', genre : '서사', release_date : '2023-08-17' },
    { id : 2, title : '콘크리트유토피아' , genre : '스릴러' , release_date : '2023-08-10'},
    { id : 3, title : '엘리먼트' , genre : '판타지' , release_date :'2023-07-15'}
  ]);

  // 새로운 영화정보를 저장할 객체 -> CreateMovie컴포넌트에 넘겨줄ㅇ ㅖ정
  const [newMovie, setNewMovie] = useState({
    id : '',
    title : '',
    genre : '',
    release_date : ''
  });

  // CreateMovie컴포넌트의 각 인풋태그에 추가할 이벤트 핸들러
  // 인풋태그의 값이 바뀔때마다(change) newMovie객체에 각 프로퍼티에 변경된 값들로 초기화시킬예정
  // ex) 영화의 제목(title)값 수정을 한다면 newMovie의 title프로퍼티에 값을 변경시켜주는 기능.
  const handleInputChange = (event) => {
    const {name, value} = event.target;
    setNewMovie({...newMovie, [name] : value });
  }

  // 영화 등록 메서드. -> 유효성 검사를 통과하면 setMovie함수를 호출하여 movies상태값을 변경해줌.
  const handleAddMovie = () =>  {
    // newMovie의 각 프로퍼티중 빈값이 있는지 검사 ( '' == false)
    if( !newMovie.id || !newMovie.title || !newMovie.genre || !newMovie.release_date){
      alert("모든 값을 똑바로 입력해주세요.");
      return;
    }
    // movies객체배열안에 현재 추가하고자하는 id값과 동일한 객체가 있는지 확인.
    const isDuplicate = movies.some( (movie) => String(movie.id) === newMovie.id );

    if(isDuplicate){
      alert("이미 존재하는 ID입니다. 다시 적으세요.");
      setNewMovie({...newMovie , ['id'] : ''});// id값만 비워줌.
      return;
    }

    setMovies([...movies, newMovie]);    
    setNewMovie({ id: '' , title : '', genre : '' , release_date : ''});
  }


  //영화 삭제 메서드 -> 투두리스트와 동일
  const handleDeleteMovie = (id) => {
    const updatedMoives = movies.filter( (movie) => movie.id !== id );
    setMovies(updatedMoives);
  }

  return (
    <Router>
      <div className='container'>
        <nav>
          <ul>
            <li>
              <Link to="/">List</Link>
            </li>
            <li>
              <Link to="/create">Add New Movie</Link>
            </li>
          </ul>
        </nav>
        <Routes>
          <Route path="/" element={<Home movies={movies} onDeleteMovie={handleDeleteMovie}  />}/>
          <Route path="/create" element={<CreateMovie newMovie={newMovie} onInputChange={handleInputChange} onAddMovie={handleAddMovie}            />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
