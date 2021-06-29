import places from 'places.js';

const initAutocomplete1 = () => {
  const addressInput = document.getElementById('address1');
  if (addressInput) {
    places({ container: addressInput });
  }
  const reconfigurableOptions = {
    type: 'city',
  };
};

const initAutocomplete2 = () => {
  const addressInput = document.getElementById('address2');
  if (addressInput) {
    places({ container: addressInput });
  }
  const reconfigurableOptions = {
    type: 'city',
  };
};

export { initAutocomplete1 };
export { initAutocomplete2 };
