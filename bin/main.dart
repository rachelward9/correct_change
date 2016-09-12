final int decimalPlace = 100;

num total;
num pay;
num changeAmount;
num change;
num remainder;
num moneyOwed;

Map<String, int> currency = {
  "dollars" : 0,
  "quarters" : 0,
  "dimes" : 0,
  "nickles" : 0,
  "pennies" : 0
};

main(List<String> args) {
  total = 15.67;
  pay = 20.67;
  calculateChange(total, pay);
  print("""
      dollars: ${currency["dollars"]}
      quarters: ${currency["quarters"]}
      dimes: ${currency["dimes"]}
      nickles: ${currency["nickles"]}
      pennies: ${currency["pennies"]}""");
}

//If they paid the exact total or more, calculate the change due. Yes, currently that means you'll calculate for 0 change. Else, they still owe you. This calculates how much they still owe you and displays an error message with that amount.
void calculateChange(num total, num pay) {
  if (pay >= total) {
    changeAmount = pay - total;
    convertCash(changeAmount);
  }

  else {
    calculateRemainingTotal();
    errorMessage();
  }
}

//This just gets rid of the decimal place, so we can work with whole numbers. Then it calls breakdownChange().
void convertCash(num amount) {
  change = amount * decimalPlace;
  breakdownChange(change);
}

//This calculates, starting with the largest currency value, how much of each currency type to give as change.
void breakdownChange(num price) {
  currency["dollars"] = price ~/ 100;
  remainder = price % 100;

  currency["quarters"] = remainder ~/ 25;
  remainder = remainder % 25;

  currency["dimes"] = remainder ~/ 10;
  remainder = remainder % 10;

  currency["nickles"] = remainder ~/ 5;
  remainder = remainder % 5;

  currency["pennies"] = remainder ~/ 1;
}

//This is called if they don't pay enough money. This calculates how much they still owe.
void calculateRemainingTotal () {
  moneyOwed = total - pay;
}

//This displays a message, including how much money they still owe.
void errorMessage() {
  print("You still owe $moneyOwed, dude.");
}

//This comment is to test GitHub with syncing.