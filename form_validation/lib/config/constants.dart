const double normalSize = 17;
const double titleSize = 20;

const String initalTitleCategory = 'Select a category';

const List<String> categoryItem = [
  'Anniversary',
  'Birthday',
  'Picnic',
  'Meeting',
];

final List checkListFrequencyItems = [
  {
    'id': 0,
    'value': false,
    'title': 'Only once',
  },
  {
    'id': 1,
    'value': false,
    'title': 'Every',
  }
];

const List<String> weekItems = [
  'weeks',
  'months',
  'years',
];

final List checkListLocationItems = [
  {
    'id': 0,
    'value': false,
    'title': 'Physical',
  },
  {
    'id': 1,
    'value': false,
    'title': 'Virtual',
  }
];

final List guestCanList = [
  {
    'id': 0,
    'value': false,
    'title': 'Consult guests list',
  },
  {
    'id': 1,
    'value': false,
    'title': 'Add other invitees',
  },
  {
    'id': 2,
    'value': false,
    'title': 'Suggest another date',
  },
];
