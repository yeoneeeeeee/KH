import { configureStore } from "@reduxjs/toolkit";
import counterReducer from '../redux/counterSlice';
import todosReducer from '../redux/todoSlice';


export default configureStore({
    reducer : {
        counter : counterReducer,
        todoList: todosReducer
    },
    middleware : []
});
