// 이건 함수형 컴포넌트 배우고나서 실습용으로 만들어보면 좋을듯.
import React, { useState } from 'react';

const Todo = () => {
  //useState를 활용하여 todolist를 state에 저장.
  const [todos, setTodos] = useState([]);
  const [inputValue, setInputValue] = useState('');

  const handleInputChange = (event) => {
    setInputValue(event.target.value);
  };

  // 투두리스트 추가 기능(형식은 자유)
  // 투두리스트 추가 완료시 input태그 내용 제거
  const handleAddTodo = () => {
    if (inputValue.trim() !== '') {
      const newTodo = {
        id: todos.length + 1,
        text: inputValue,
      };
      setTodos([...todos, newTodo]);
      setInputValue('');
    }
  };

  // 완료한 투두리스트 삭제 기능(형식은 자유)
  const handleDeleteTodo = (id) => {
    const updatedTodos = todos.filter((todo) => todo.id !== id);
    setTodos(updatedTodos);
  };

  return (
    <div>
      <h2>Todo List</h2>
      <input type="text" value={inputValue} onChange={handleInputChange} />
      <button onClick={handleAddTodo}>Add</button>
      <ul>
        
        {todos.map((todo) => (
          //key ? 태그에 key속성 부여시 리액트에서 랜더링시 각 항목들을 
          <li key={todo.id}> 
            {todo.text}
            <a onClick={() => handleDeleteTodo(todo.id)}>🧡</a>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Todo;