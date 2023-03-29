import { Navigate, Route, Routes } from 'react-router-dom';
import './App.css';
import AboutUs from './Pages/AboutUs';
import ContactUs from './Pages/ContactUs';
import Home from './Pages/Home';

function App() {
  return (
    <div className="App">
      <Routes>
          <Route exact path='/' element={<Home/>}/>  
          <Route path='/AboutUs' element={<AboutUs/>}/> 
          <Route path='/ContactUs' element={<ContactUs/>}/> 
          <Route path="*" element={<Navigate to="/" />} />
        </Routes>
    </div>
  );
}

export default App;
