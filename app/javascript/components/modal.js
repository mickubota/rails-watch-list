const initListModal = () => {
  const newListButton = document.querySelector('#list-button');
  if (newListButton) {
    newListButton.addEventListener('click', (event) => {
    event.preventDefault;
    $('#list-modal-form').modal()
  })}
};

export { initListModal };
