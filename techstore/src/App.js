import { Navigate, Route, Routes } from 'react-router-dom';
import './App.css';
import AboutUs from './Pages/AboutUs';
import ContactUs from './Pages/ContactUs';
import Home from './Pages/Home';
import Dashboard from './Pages/Dashboard';
import Produktet from './Pages/Produktet';
import Produkti from './Pages/Produkti';
import Cart from './Pages/Cart';
import Fatura from './Components/Fatura/Fatura'
import LogIn from './Pages/LogIn';
import SignUp from './Pages/SignUp';


function App() {
  return (
    <div className="App">
      <Routes>
        <Route exact path='/' element={<Home />} />
        <Route path='/AboutUs' element={<AboutUs />} />
        <Route path='/ContactUs' element={<ContactUs />} />
        <Route path='/Dashboard' element={<Dashboard key={Date.now()}/> } />
        <Route path='/Produktet' element={<Produktet key={Date.now()} />} exact />
        <Route path='/Produktet/:kompania'  element={<Produktet key={Date.now()} />} exact />
        <Route path='/Cart' element={<Cart/>} />
        <Route path='/Produkti/:produktiID' element={<Produkti key={Date.now()}/>} exact />
        <Route path='/LogIn' element={<LogIn />} />
        <Route path='/SignUp' element={<SignUp />} />
        <Route path="*" element={<Navigate to="/" />} />
        <Route path="/Fatura/:nrFatures" element = {<Fatura />} />
      </Routes>
    </div>
  );
}

export default App;
