import {useState , useCallback} from 'react';

function TodoList(){

    //useState를 활용하여 todolist를 state에 저장
    const [todos, setTodos] = useState([]);

    // 투두리스트 추가기능
    const handleAddTodo = useCallback(() => {
        const input = document.querySelector("input[type='text']");
        const newTodo = {
            todo : input.value
        }
        setTodos([...todos, newTodo]);
        input.value = "";
    },[todos]);

    // 완료한 투두리스트 삭제기능.
    const handleDeleteTodo = (index) => {
        const updateTodos = todos.filter( function ( item, index2){
            if(index2 != index){
                return true;
            }else{
                return false;
            }
        })
        setTodos(updateTodos);
    };

    return(
        <div>
            <h2>Todo List</h2>
            <input type="text"/>
            <button onClick={handleAddTodo}>추가</button>
            <ul>
                {
                    todos.map( (item ,index) => {                        
                        return (<li key={index}>
                                {item.todo}
                                <a onClick={() => handleDeleteTodo(index)}>✅</a>
                            </li>)
                    })
                }
            </ul>
        </div>
    )
}

export default TodoList;