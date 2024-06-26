import { useEffect, useState } from "react";
import classes from "./Styles/AdminDashboard.css";
import axios from "axios";
import Mesazhi from "../layout/Mesazhi";
import { TailSpin } from "react-loader-spinner";
import { useNavigate } from "react-router-dom";
import { MDBRow, MDBCol, MDBInput } from "mdb-react-ui-kit";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faX,
  faEye,
  faEyeSlash,
  faPenToSquare,
} from "@fortawesome/free-solid-svg-icons";

import Form from "react-bootstrap/Form";

import data from "../../Data/Data";

function PerditesoTeDhenat(props) {
  const [teDhenat, setTeDhenat] = useState([]);
  const [perditeso, setPerditeso] = useState("");
  const [shfaqMesazhin, setShfaqMesazhin] = useState(false);
  const [tipiMesazhit, setTipiMesazhit] = useState("");
  const [pershkrimiMesazhit, setPershkrimiMesazhit] = useState("");
  const [loading, setLoading] = useState(false);

  const [editoTeDhenat, setEditoTeDhenat] = useState(false);
  const [editoAdresen, setEditoAdresen] = useState(false);
  const [editoFjalekalimin, setEditoFjalekalimin] = useState(false);

  const [fjalekalimiAktual, setFjalekalimiAktual] = useState("");
  const [fjalekalimiIRi, setFjalekalimiIRi] = useState("");
  const [shfaqFjalekalimin, setShfaqFjalekalimin] = useState(false);
  const [showPassword, setShowPassword] = useState(false);

  const handleTogglePassword = () => {
    setShowPassword(!showPassword);
  };

  const navigate = useNavigate();

  const [formValue, setFormValue] = useState({
    emri: "",
    mbiemri: "",
    email: "",
    username: "",
    nrKontaktit: "",
    qyteti: "",
    zipKodi: "",
    adresa: "",
    shteti: "",
  });

  const getID = localStorage.getItem("id");

  useEffect(() => {
    if (getID) {
      const vendosTeDhenat = async () => {
        try {
          const perdoruesi = data.shfaqPerdoruesit.find(
            (item) => item.perdoruesi.aspNetUserId == getID
          );
          setTeDhenat(perdoruesi);
        } catch (err) {
          console.log(err);
        } finally {
          setLoading(false);
        }
      };

      vendosTeDhenat();
    } else {
      navigate("/login");
    }
  }, [perditeso]);

  const handleShtetiChange = (event) => {
    setFormValue({ ...formValue, shteti: event.target.value });
  };

  const onChange = (e) => {
    setFormValue({ ...formValue, [e.target.name]: e.target.value });
  };

  const handleFjalekalimiAktual = (e) => {
    setFjalekalimiAktual(e.target.value);
  };

  const handleFjalekalimiIRi = (e) => {
    setFjalekalimiIRi(e.target.value);
  };

  const handleEditoTeDhenat = (e) => {
    e.preventDefault();

    setEditoTeDhenat(true);
    setEditoAdresen(false);
    setEditoFjalekalimin(false);
  };

  const handleEditoAdresen = (e) => {
    e.preventDefault();

    setEditoAdresen(true);
    setEditoFjalekalimin(false);
    setEditoTeDhenat(false);
  };

  const handleEditoFjalekalimn = (e) => {
    e.preventDefault();

    setEditoFjalekalimin(true);
    setEditoAdresen(false);
    setEditoTeDhenat(false);
  };

  const handleAnuloPerditesimin = (event) => {
    event.preventDefault();

    setEditoFjalekalimin(false);
    setEditoAdresen(false);
    setEditoTeDhenat(false);
  };

  function isNullOrEmpty(value) {
    return value === null || value === "" || value === undefined;
  }

  const kontrolloNdryshimet = () => {
    const teDhenatPerdoruesit =
      teDhenat.perdoruesi && teDhenat.perdoruesi.teDhenatPerdoruesit;

    if (
      formValue.emri !== (teDhenat.perdoruesi && teDhenat.perdoruesi.emri) ||
      formValue.mbiemri !==
        (teDhenat.perdoruesi && teDhenat.perdoruesi.mbiemri) ||
      formValue.email !== (teDhenat.perdoruesi && teDhenat.perdoruesi.email) ||
      formValue.username !==
        (teDhenat.perdoruesi && teDhenat.perdoruesi.username) ||
      formValue.nrKontaktit !==
        (teDhenatPerdoruesit && teDhenatPerdoruesit.nrKontaktit) ||
      formValue.qyteti !==
        (teDhenatPerdoruesit && teDhenatPerdoruesit.qyteti) ||
      formValue.adresa !==
        (teDhenatPerdoruesit && teDhenatPerdoruesit.adresa) ||
      formValue.shteti !==
        (teDhenatPerdoruesit && teDhenatPerdoruesit.shteti) ||
      formValue.zipKodi !== (teDhenatPerdoruesit && teDhenatPerdoruesit.zipKodi)
    ) {
      return true;
    }

    return false;
  };

  async function EditoTeDhenat(e) {
    e.preventDefault();

    try {
      if (
        !isNullOrEmpty(formValue.emri) &&
        !isNullOrEmpty(formValue.mbiemri) &&
        !isNullOrEmpty(formValue.email) &&
        !isNullOrEmpty(formValue.username) &&
        !isNullOrEmpty(formValue.nrKontaktit)
      ) {
        if (teDhenat.perdoruesi.email === formValue.email) {
          setPerditeso(Date.now());

          if (kontrolloNdryshimet() === true) {
            props.pershkrimi(
              "<strong>Te dhenat u perditesuan me sukses!</strong>"
            );
            props.tipi("success");
            props.setShfaqMesazhin();
            props.perditeso();
          }

          handleAnuloPerditesimin(e);
        } else {
          props.pershkrimi("<strong>Ky email nuk eshte i vlefshem!</strong>");
          props.tipi("danger");
          props.setShfaqMesazhin();
          props.perditeso();
        }
      } else {
        props.pershkrimi(
          "<strong>Ju lutem plotesoni te gjitha te dhenat!</strong>"
        );
        props.tipi("danger");
        props.setShfaqMesazhin();
        props.perditeso();
      }
    } catch (error) {
      console.error(error);
    }
  }

  async function EditoAdresen(e) {
    e.preventDefault();
    try {
      if (
        !isNullOrEmpty(formValue.qyteti) &&
        !isNullOrEmpty(formValue.adresa) &&
        !isNullOrEmpty(formValue.shteti) &&
        formValue.zipKodi > 0
      ) {
        setPerditeso(Date.now());

        if (kontrolloNdryshimet() === true) {
          props.pershkrimi("<strong>Adresa u perditesua me sukses!</strong>");
          props.tipi("success");
          props.setShfaqMesazhin();
          props.perditeso();
        }

        handleAnuloPerditesimin(e);
      } else {
        props.pershkrimi(
          "<strong>Ju lutem plotesoni te gjitha te dhenat e adreses!</strong>"
        );
        props.tipi("danger");
        props.setShfaqMesazhin();
        props.perditeso();
      }
    } catch (error) {
      console.error(error);
    }
  }

  async function EditoFjalekalimin(e) {
    e.preventDefault();
    try {
      if (!isNullOrEmpty(fjalekalimiAktual) && !isNullOrEmpty(fjalekalimiIRi)) {
        const passREGEX =
          /^[A-Z][A-Za-z0-9@$!%*?&]*[a-z][A-Za-z0-9@$!%*?&]*[0-9][A-Za-z0-9@$!%*?&]*$/;

        if (passREGEX.test(fjalekalimiIRi)) {
          setPerditeso(Date.now());

          setFjalekalimiAktual("");
          setFjalekalimiIRi("");
          setShfaqFjalekalimin(false);

          props.pershkrimi("<strong>Fjalekalimi u perditesua!</strong>");
          props.tipi("success");
          props.setShfaqMesazhin();
          props.perditeso();

          handleAnuloPerditesimin(e);
        } else {
          setShfaqFjalekalimin(false);

          props.pershkrimi(
            "Fjalekalimi duhet te permbaj <strong>shkronja, numra dhe simbole si dhe shkroja e pare duhet te jete e madhe!</strong>"
          );
          props.tipi("danger");
          props.setShfaqMesazhin();
          props.perditeso();
        }
      } else {
        setShfaqFjalekalimin(false);

        props.pershkrimi(
          "<strong>Ju lutem plotesoni te gjitha fushat e fjalekalimit!</strong>"
        );
        props.tipi("danger");
        props.setShfaqMesazhin();
        props.perditeso();
      }
    } catch (error) {
      console.error(error);
    }
  }

  useEffect(() => {
    if (teDhenat) {
      setFormValue({
        ...formValue,
        emri: teDhenat.perdoruesi && teDhenat.perdoruesi.emri,
        mbiemri: teDhenat.perdoruesi && teDhenat.perdoruesi.mbiemri,
        email: teDhenat.perdoruesi && teDhenat.perdoruesi.email,
        username: teDhenat.perdoruesi && teDhenat.perdoruesi.username,
        nrKontaktit:
          teDhenat.perdoruesi &&
          teDhenat.perdoruesi.teDhenatPerdoruesit.nrKontaktit,
        qyteti:
          teDhenat.perdoruesi && teDhenat.perdoruesi.teDhenatPerdoruesit.qyteti,
        zipKodi:
          teDhenat.perdoruesi &&
          teDhenat.perdoruesi.teDhenatPerdoruesit.zipKodi,
        adresa:
          teDhenat.perdoruesi && teDhenat.perdoruesi.teDhenatPerdoruesit.adresa,
        shteti:
          teDhenat.perdoruesi && teDhenat.perdoruesi.teDhenatPerdoruesit.shteti,
      });
    }
  }, [teDhenat]);

  return (
    <div className={classes.containerDashboardP}>
      {shfaqMesazhin && (
        <Mesazhi
          setShfaqMesazhin={setShfaqMesazhin}
          pershkrimi={pershkrimiMesazhit}
          tipi={tipiMesazhit}
        />
      )}
      {loading ? (
        <div className="Loader">
          <TailSpin
            height="80"
            width="80"
            color="#009879"
            ariaLabel="tail-spin-loading"
            radius="1"
            wrapperStyle={{}}
            wrapperClass=""
            visible={true}
          />
        </div>
      ) : (
        <>
          <h1 className="titulliPerditeso">Perditesimi i Te Dhenave</h1>
          <div className="PerditesoTeDhenatContainer">
            <button
              className="btn btn-secondary btn-small"
              role="button"
              onClick={() => props.setMbyllPerditesoTeDhenat()}>
              Mbyll <FontAwesomeIcon icon={faX} />
            </button>

            <h1 className="title">Te Dhenat Personale</h1>
            <MDBRow tag="form" className="g-3">
              <MDBCol md="6">
                <MDBInput
                  value={formValue.emri ?? ""}
                  name="emri"
                  onChange={onChange}
                  id="emri"
                  required
                  label="Emri"
                  disabled={!editoTeDhenat}
                />
              </MDBCol>
              <MDBCol md="6">
                <MDBInput
                  value={formValue.mbiemri ?? ""}
                  name="mbiemri"
                  onChange={onChange}
                  id="mbiemri"
                  required
                  label="Mbiemri"
                  disabled={!editoTeDhenat}
                />
              </MDBCol>
              <MDBCol md="4">
                <MDBInput
                  value={formValue.email ?? ""}
                  name="email"
                  onChange={onChange}
                  id="email"
                  required
                  label="Email"
                  disabled={!editoTeDhenat}
                />
              </MDBCol>
              <MDBCol md="4">
                <MDBInput
                  value={formValue.username ?? ""}
                  name="username"
                  onChange={onChange}
                  id="username"
                  required
                  label="Username"
                  disabled={!editoTeDhenat}
                />
              </MDBCol>
              <MDBCol md="4">
                <MDBInput
                  value={formValue.nrKontaktit ?? ""}
                  name="nrKontaktit"
                  onChange={onChange}
                  id="nrKontaktit"
                  required
                  label="Numri Telefonit"
                  disabled={!editoTeDhenat}
                />
              </MDBCol>
              <div className="col-12">
                {!editoTeDhenat && (
                  <button
                    className="btn btn-primary btn-small"
                    role="button"
                    onClick={handleEditoTeDhenat}>
                    Ndrysho te dhenat Personale{" "}
                    <FontAwesomeIcon icon={faPenToSquare} />
                  </button>
                )}

                {editoTeDhenat && (
                  <div className="butonatPerditesoTeDhenat">
                    <button
                      className="btn btn-success btn-small"
                      role="button"
                      onClick={EditoTeDhenat}>
                      Ruaj
                    </button>
                    <button
                      className="btn btn-secondary btn-small"
                      role="button"
                      onClick={handleAnuloPerditesimin}>
                      Anulo
                    </button>
                  </div>
                )}
              </div>
              <h1 className="title">Adresa</h1>
              <MDBCol md="6">
                <MDBInput
                  value={formValue.adresa ?? "" ? formValue.adresa : ""}
                  name="adresa"
                  onChange={onChange}
                  id="adresa"
                  required
                  label="Adresa"
                  disabled={!editoAdresen}
                />
              </MDBCol>
              <MDBCol md="6">
                <MDBInput
                  value={formValue.qyteti ?? "" ? formValue.qyteti : ""}
                  name="qyteti"
                  onChange={onChange}
                  id="qyteti"
                  required
                  label="Qyteti"
                  disabled={!editoAdresen}
                />
              </MDBCol>
              <MDBCol md="6">
                <Form.Select
                  value={formValue.shteti ?? ""}
                  onChange={handleShtetiChange}
                  disabled={!editoAdresen}>
                  <option hidden disabled>
                    Zgjedhni Shtetin
                  </option>
                  <option>Kosovë</option>
                  <option>Shqipëri</option>
                  <option>Maqedoni e Veriut</option>
                </Form.Select>
                <Form.Label>State</Form.Label>
              </MDBCol>
              <MDBCol md="6">
                <MDBInput
                  value={formValue.zipKodi ?? ""}
                  name="zipKodi"
                  type="number"
                  onChange={onChange}
                  id="zipKodi"
                  required
                  label="Zip Kodi"
                  disabled={!editoAdresen}
                />
              </MDBCol>
              <div className="col-12">
                {!editoAdresen && (
                  <button
                    className="btn btn-primary btn-small"
                    role="button"
                    onClick={handleEditoAdresen}>
                    Ndrysho Adresen <FontAwesomeIcon icon={faPenToSquare} />
                  </button>
                )}

                {editoAdresen && (
                  <div className="butonatPerditesoTeDhenat">
                    <button
                      className="btn btn-success btn-small"
                      role="button"
                      onClick={EditoAdresen}>
                      Ruaj
                    </button>
                    <button
                      className="btn btn-secondary btn-small"
                      role="button"
                      onClick={handleAnuloPerditesimin}>
                      Anulo
                    </button>
                  </div>
                )}
              </div>
              <h1 className="title">Fjalekalimi</h1>
              <MDBCol md="6">
                <MDBInput
                  value={fjalekalimiAktual}
                  name="fjalekalimiAktual"
                  onChange={handleFjalekalimiAktual}
                  id="fjalekalimiAktual"
                  required
                  label="Fjalekalimi aktual"
                  disabled={!editoFjalekalimin}
                  type={showPassword ? "text" : "password"}
                />
              </MDBCol>
              <MDBCol md="6">
                <MDBInput
                  value={fjalekalimiIRi}
                  name="fjalekalimiIRi"
                  onChange={handleFjalekalimiIRi}
                  id="fjalekalimiIRi"
                  required
                  label="Fjalekalimi i ri"
                  disabled={!editoFjalekalimin}
                  type={showPassword ? "text" : "password"}
                />
              </MDBCol>
              <div className="col-12">
                {!editoFjalekalimin && (
                  <button
                    className="btn btn-primary btn-small"
                    role="button"
                    onClick={handleEditoFjalekalimn}>
                    Ndrysho Fjalekalimin{" "}
                    <FontAwesomeIcon icon={faPenToSquare} />
                  </button>
                )}

                {editoFjalekalimin && (
                  <div className="butonatPerditesoTeDhenat">
                    <button
                      className="btn btn-success btn-small"
                      role="button"
                      onClick={EditoFjalekalimin}>
                      Ruaj
                    </button>
                    <button type="button" onClick={handleTogglePassword}>
                      {showPassword ? (
                        <FontAwesomeIcon icon={faEyeSlash} />
                      ) : (
                        <FontAwesomeIcon icon={faEye} />
                      )}
                    </button>
                    <button
                      className="btn btn-secondary btn-small"
                      role="button"
                      onClick={handleAnuloPerditesimin}>
                      Anulo
                    </button>
                  </div>
                )}
              </div>
            </MDBRow>
          </div>
        </>
      )}
    </div>
  );
}

export default PerditesoTeDhenat;
