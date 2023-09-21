import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import ReduxApp from './01_Redux';
import App from './App'

import store from './store/store';
import {Provider} from 'react-redux';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <Provider store={store}>
      <App/>
    </Provider>
);

