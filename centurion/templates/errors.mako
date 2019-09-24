% if form.errors:
  % for field_name, field_errors in form.errors.items():
    % for error in field_errors:
      <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <strong>${form[field_name].label}:</strong> ${error}
      </div>
    % endfor
  % endfor
% endif