function filterCategory() {
    const input = document.getElementById('search').value.toLowerCase();
    const rows = document.querySelectorAll('#menuTable tr');
    let found = false;

    rows.forEach(row => {
        const cells = row.querySelectorAll('td');
        let match = false;

        cells.forEach(cell => {
            if (cell.innerText.toLowerCase().includes(input)) {
                match = true;
            }
        });

        row.style.display = match ? '' : 'none';
        found = found || match;
    });

    document.getElementById('noResults').style.display = found ? 'none' : 'block';
}