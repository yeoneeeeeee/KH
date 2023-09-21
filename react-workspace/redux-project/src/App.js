import logo from './logo.svg';
import './App.css';
import Counter from './components/Couter'
import TodoList from './components/TodoList';
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom';
import {Navbar , NavbarBrand} from 'reactstrap';
import 'bootstrap/dist/css/bootstrap.css';

function App() {
  return (
    <Router>
      <Navbar>
        <NavbarBrand href="/">HOME</NavbarBrand>
        <NavbarBrand href="/todolist">TodoList</NavbarBrand>
        <NavbarBrand href="/counter">counter</NavbarBrand>
      </Navbar>
    <div className='container'>
      <Routes>
        <Route path="/" element={<TodoList/>}/>
        <Route path="/todolist" element={<TodoList/>}/>
        <Route path="/counter" element={<Counter/>}/>
      </Routes>
    </div>
    </Router>
  );
}

export default App;
