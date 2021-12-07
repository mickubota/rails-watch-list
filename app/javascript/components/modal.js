const initListModal = () => {
  const newListButton = document.querySelector('#list-button');
  if (newListButton) {
    newListButton.addEventListener('click', () =>
    $('#list-modal-form').modal())
  }
};

export { initListModal };
