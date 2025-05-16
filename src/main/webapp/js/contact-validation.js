document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("contact_form");

    // contact-validation.js
    console.log("Validation script loaded!");

    document.addEventListener("DOMContentLoaded", () => {
        console.log("DOMContentLoaded fired, starting validation setup");
        // ...rest of your code
    });


    const validators = {
        name: value => /^[A-Za-z\s]{2,}$/.test(value.trim()) || "Please enter a valid name (letters only).",
        email: value => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value) || "Please enter a valid email.",
        contact_no: value => /^\+94\s?\d{2}\s?\d{3}\s?\d{4}$/.test(value.trim()) || "Use +94 77 123 4567 format.",
        request_type: value => value !== "" || "Please select a request type.",
        subject: value => value.trim().length > 0 || "Subject cannot be empty.",
        message: value => value.trim().length > 0 || "Message cannot be empty."
    };

    const showError = (input, message) => {
        input.classList.add("invalid");
        let error = input.nextElementSibling;
        if (!error || !error.classList.contains("error")) {
            error = document.createElement("div");
            error.className = "error";
            input.parentNode.appendChild(error);
        }
        error.textContent = message;
    };

    const clearError = input => {
        input.classList.remove("invalid");
        const error = input.parentNode.querySelector(".error");
        if (error) error.remove();
    };

    const validateField = input => {
        const name = input.name;
        const value = input.value;
        const validate = validators[name];
        if (!validate) return true; // skip if no validator
        const result = validate(value);
        if (result !== true) {
            showError(input, result);
            return false;
        } else {
            clearError(input);
            return true;
        }
    };

    // Real-time validation
    Object.keys(validators).forEach(fieldName => {
        const field = form.elements[fieldName];
        field.addEventListener("input", () => validateField(field));
        field.addEventListener("blur", () => validateField(field));
    });

    form.addEventListener("submit", e => {
        let isValid = true;
        Object.keys(validators).forEach(fieldName => {
            const field = form.elements[fieldName];
            if (!validateField(field)) isValid = false;
        });
        if (!isValid) {
            e.preventDefault();
        }
    });
});
