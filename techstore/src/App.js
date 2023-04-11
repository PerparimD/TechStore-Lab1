import { Navigate, Route, Routes } from 'react-router-dom';
import './App.css';
import AboutUs from './Pages/AboutUs';
import ContactUs from './Pages/ContactUs';
import Home from './Pages/Home';
import Dashboard from './Pages/Dashboard';
import Produktet from './Pages/Produktet';

function App() {
  return (
    <div className="App">
      <Routes>
        <Route exact path='/' element={<Home />} />
        <Route path='/AboutUs' element={<AboutUs />} />
        <Route path='/ContactUs' element={<ContactUs />} />
        <Route path='/Dashboard' element={<Dashboard />} />
        <Route path='/Produktet' element={<Produktet key="default"/>} exact />
        <Route path='/Produktet/:llojiKerkimitNgaLinku/:termiPerKerkimNgaLinku' element={<Produktet />} exact/>
        <Route path="*" element={<Navigate to="/" />} />
      </Routes>
    </div>
  );
}

export default App;
