// contact-validation.js
document.addEventListener("DOMContentLoaded", () => {
    // Look for either the new-contact form or the update form
    const form = document.getElementById("contact_form")
        || document.getElementById("updateForm");

    if (!form) {
        console.warn("No form found for validation");
        return;
    }
    console.log("Validation script loaded for form:", form.id);

    // Define your validators
    const validators = {
        name: value => /^[A-Za-z\s]{2,}$/.test(value.trim()) || "Please enter a valid name (letters only).",
        email: value => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value) || "Please enter a valid email.",
        contact_no: value => /^\+94\s?\d{2}\s?\d{3}\s?\d{4}$/.test(value.trim()) || "Use +94 77 123 4567 format.",
        request_type: value => value !== "" || "Please select a request type.",
        subject: value => value.trim().length > 0 || "Subject cannot be empty.",
        message: value => value.trim().length > 0 || "Message cannot be empty."
    };

    // Show / clear inline errors
    const showError = (input, msg) => {
        input.classList.add("invalid");
        let e = input.parentNode.querySelector(".error");
        if (!e) {
            e = document.createElement("div");
            e.className = "error";
            input.parentNode.appendChild(e);
        }
        e.textContent = msg;
    };
    const clearError = input => {
        input.classList.remove("invalid");
        const e = input.parentNode.querySelector(".error");
        if (e) e.remove();
    };

    // Validate a single field
    const validateField = input => {
        const rule = validators[input.name];
        if (!rule) return true;
        const result = rule(input.value);
        if (result !== true) {
            showError(input, result);
            return false;
        } else {
            clearError(input);
            return true;
        }
    };

    // Attach real-time validation
    Object.keys(validators).forEach(fieldName => {
        const fld = form.elements[fieldName];
        if (!fld) return;
        fld.addEventListener("input", () => validateField(fld));
        fld.addEventListener("blur", () => validateField(fld));
    });

    // Prevent submission if any field invalid
    form.addEventListener("submit", e => {
        let ok = true;
        Object.keys(validators).forEach(name => {
            const fld = form.elements[name];
            if (fld && !validateField(fld)) ok = false;
        });
        if (!ok) e.preventDefault();
    });
});
