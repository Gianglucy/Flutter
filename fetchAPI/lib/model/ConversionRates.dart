class ConversionRates {
  num eUR;
  num aED;
  num aRS;
  num aUD;
  num bGN;
  num bRL;
  num bSD;
  num cAD;
  num cHF;
  num cLP;
  num cNY;
  num cOP;
  num cZK;
  num dKK;
  num dOP;
  num eGP;
  num fJD;
  num gBP;
  num gTQ;
  num hKD;
  num hRK;
  num hUF;
  num iDR;
  num iLS;
  num iNR;
  num iSK;
  num jPY;
  num kRW;
  num kZT;
  num mVR;
  num mXN;
  num mYR;
  num nOK;
  num nZD;
  num pAB;
  num pEN;
  num pHP;
  num pKR;
  num pLN;
  num pYG;
  num rON;
  num rUB;
  num sAR;
  num sEK;
  num sGD;
  num tHB;
  num tRY;
  num tWD;
  num uAH;
  num uSD;
  num uYU;
  num zAR;

  ConversionRates(
      {this.eUR,
      this.aED,
      this.aRS,
      this.aUD,
      this.bGN,
      this.bRL,
      this.bSD,
      this.cAD,
      this.cHF,
      this.cLP,
      this.cNY,
      this.cOP,
      this.cZK,
      this.dKK,
      this.dOP,
      this.eGP,
      this.fJD,
      this.gBP,
      this.gTQ,
      this.hKD,
      this.hRK,
      this.hUF,
      this.iDR,
      this.iLS,
      this.iNR,
      this.iSK,
      this.jPY,
      this.kRW,
      this.kZT,
      this.mVR,
      this.mXN,
      this.mYR,
      this.nOK,
      this.nZD,
      this.pAB,
      this.pEN,
      this.pHP,
      this.pKR,
      this.pLN,
      this.pYG,
      this.rON,
      this.rUB,
      this.sAR,
      this.sEK,
      this.sGD,
      this.tHB,
      this.tRY,
      this.tWD,
      this.uAH,
      this.uSD,
      this.uYU,
      this.zAR});

  ConversionRates.fromJson(Map<String, dynamic> json) {
    eUR = json['EUR'];
    aED = json['AED'];
    aRS = json['ARS'];
    aUD = json['AUD'];
    bGN = json['BGN'];
    bRL = json['BRL'];
    bSD = json['BSD'];
    cAD = json['CAD'];
    cHF = json['CHF'];
    cLP = json['CLP'];
    cNY = json['CNY'];
    cOP = json['COP'];
    cZK = json['CZK'];
    dKK = json['DKK'];
    dOP = json['DOP'];
    eGP = json['EGP'];
    fJD = json['FJD'];
    gBP = json['GBP'];
    gTQ = json['GTQ'];
    hKD = json['HKD'];
    hRK = json['HRK'];
    hUF = json['HUF'];
    iDR = json['IDR'];
    iLS = json['ILS'];
    iNR = json['INR'];
    iSK = json['ISK'];
    jPY = json['JPY'];
    kRW = json['KRW'];
    kZT = json['KZT'];
    mVR = json['MVR'];
    mXN = json['MXN'];
    mYR = json['MYR'];
    nOK = json['NOK'];
    nZD = json['NZD'];
    pAB = json['PAB'];
    pEN = json['PEN'];
    pHP = json['PHP'];
    pKR = json['PKR'];
    pLN = json['PLN'];
    pYG = json['PYG'];
    rON = json['RON'];
    rUB = json['RUB'];
    sAR = json['SAR'];
    sEK = json['SEK'];
    sGD = json['SGD'];
    tHB = json['THB'];
    tRY = json['TRY'];
    tWD = json['TWD'];
    uAH = json['UAH'];
    uSD = json['USD'];
    uYU = json['UYU'];
    zAR = json['ZAR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EUR'] = this.eUR;
    data['AED'] = this.aED;
    data['ARS'] = this.aRS;
    data['AUD'] = this.aUD;
    data['BGN'] = this.bGN;
    data['BRL'] = this.bRL;
    data['BSD'] = this.bSD;
    data['CAD'] = this.cAD;
    data['CHF'] = this.cHF;
    data['CLP'] = this.cLP;
    data['CNY'] = this.cNY;
    data['COP'] = this.cOP;
    data['CZK'] = this.cZK;
    data['DKK'] = this.dKK;
    data['DOP'] = this.dOP;
    data['EGP'] = this.eGP;
    data['FJD'] = this.fJD;
    data['GBP'] = this.gBP;
    data['GTQ'] = this.gTQ;
    data['HKD'] = this.hKD;
    data['HRK'] = this.hRK;
    data['HUF'] = this.hUF;
    data['IDR'] = this.iDR;
    data['ILS'] = this.iLS;
    data['INR'] = this.iNR;
    data['ISK'] = this.iSK;
    data['JPY'] = this.jPY;
    data['KRW'] = this.kRW;
    data['KZT'] = this.kZT;
    data['MVR'] = this.mVR;
    data['MXN'] = this.mXN;
    data['MYR'] = this.mYR;
    data['NOK'] = this.nOK;
    data['NZD'] = this.nZD;
    data['PAB'] = this.pAB;
    data['PEN'] = this.pEN;
    data['PHP'] = this.pHP;
    data['PKR'] = this.pKR;
    data['PLN'] = this.pLN;
    data['PYG'] = this.pYG;
    data['RON'] = this.rON;
    data['RUB'] = this.rUB;
    data['SAR'] = this.sAR;
    data['SEK'] = this.sEK;
    data['SGD'] = this.sGD;
    data['THB'] = this.tHB;
    data['TRY'] = this.tRY;
    data['TWD'] = this.tWD;
    data['UAH'] = this.uAH;
    data['USD'] = this.uSD;
    data['UYU'] = this.uYU;
    data['ZAR'] = this.zAR;
    return data;
  }
}
