CREATE TABLE oauth_token (
    instance_id text NOT NULL,
    component_id text NOT NULL,
    access_token text NOT NULL,
    refresh_token text,
    token_type text,
    expires timestamp,
    provider text NOT NULL,
    created timestamp NOT NULL,
    PRIMARY KEY (instance_id, component_id)
);

CREATE TABLE widget_settings (
    instance_id text NOT NULL,
    component_id text NOT NULL,
    settings json DEFAULT '{}',
    service_settings json DEFAULT '{}',
    curr_provider text,
    user_profile json DEFAULT '{}',
    updated timestamp NOT NULL,
    created timestamp NOT NULL,
    PRIMARY KEY (instance_id, component_id)
);

CREATE TABLE session (
    session_id bigserial PRIMARY KEY,
    instance_id text NOT NULL,
    component_id text NOT NULL,
    closed boolean NOT NULL DEFAULT false,
    created timestamp NOT NULL
)

CREATE TABLE file (
    file_id bigserial PRIMARY KEY,
    session_id bigint REFERENCES session ON DELETE RESTRICT,
    temp_name text NOT NULL,
    original_name text NOT NULL,
    size bigint NOT NULL,
    created timestamp NOT NULL
);

CREATE TABLE upload_failure (
    file_id bigint PRIMARY KEY REFERENCES file ON DELETE CASCADE,
    resolved boolean NOT NULL DEFAULT false
);
