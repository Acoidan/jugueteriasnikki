class Cliente {
	String NumeroTarjeta;
	String ClaveTarjeta;

	Cliente ({this.NumeroTarjeta, this.ClaveTarjeta});

	String getNumeroTrjeta() {
		return NumeroTarjeta;
	}
	String getClaveTarjeta() {
		return ClaveTarjeta;
	}

	void setNumeroTarjeta(String NumeroTarjeta) {
		this.NumeroTarjeta = NumeroTarjeta;
	}
	void setClaveTarjeta(String ClaveTarjeta) {
		this.ClaveTarjeta = ClaveTarjeta;
	}

}
