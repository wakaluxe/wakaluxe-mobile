String subscription_amount(String plan) {
  switch (plan) {
    case 'Business':
      return '50,000XAF';
    case 'Family':
      return '40,000XAF';
    case 'Personal':
      return '20,000XAF';
    default:
      return 'Not Found';
  }
}
