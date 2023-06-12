import React from "react";
import { useBarcode } from 'next-barcode';

const Barkodi = ({ value }) => {
  const { inputRef } = useBarcode({ value });

  return <svg ref={inputRef} style={{ width: "200px", height: "200px" }} />;
};

export default Barkodi;