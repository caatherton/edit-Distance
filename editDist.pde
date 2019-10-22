void setup() {
}

void draw() {
  println(editDist("will", "bill"));
}

int editDist(String s1, String s2) {
  s1 = "0" + s1;
  s2 = "0" + s2;
  int[][] lev = new int [s1.length()][s2.length()];
  for (int i =0; i <s1.length(); i++) {
    lev[i][0]=i;
  }
  for (int i =0; i <s2.length(); i++) {
    lev[0][i]=i;
  }


  for (int pos1=1; pos1 <s1.length(); pos1++) {
    for (int pos2 = 1; pos2 < s2.length(); pos2++) {
      if (s1.charAt(pos1)==s2.charAt(pos2)) {
        lev[pos1][pos2]=lev[pos1-1][pos2-1];
      } else {
        lev[pos1][pos2]= min(lev[pos1-1][pos2-1], lev[pos1-1][pos2], lev[pos1][pos2-1])+1;
      }
    }
  }
  return lev[s1.length()-1][s2.length()-1];
}
