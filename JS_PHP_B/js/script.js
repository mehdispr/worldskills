const app = new Vue({
    el: '#app',
    data: {
        api_base_uri: '../JS-PHP_A/api/v1',
        auth: {
            username: '',
            password: '',
        },
        profile: {
            firstname: '',
            lastname: '',
            email: '',
            linkedin_url: '',
            username: '',
            password: '',
        },
        token: '',
        user: {},

        events: [],
        date: '',
        event: {},
        registrations: [],
        registration: {
            event_id: '',
            registration_type: '',
        },

        alert: {
            message: '',
            type: '',
        },
    },
    watch: {
        token: function (token) {
            if (token) {
                localStorage.setItem('token', token);
                this.showProfile();
                this.listEvents();
                this.listRegistrations();
            } else {
                localStorage.removeItem('token');
                this.user = {};
                this.events = [];
                this.registrations = [];
            }
        },
    },
    computed: {
        filteredEvents: function () {
            return this.events.filter(event => event.date >= this.date);
        },
        calculated_price: function () {
            if ('early_bird' === this.registration.registration_type) {
                return this.event.standard_price * 0.85;
            }

            if ('vip' === this.registration.registration_type) {
                return this.event.standard_price * 1.2;
            }

            return this.event.standard_price;
        },
    },
    mounted() {
        this.auth.username = 'attendee1';
        this.auth.password = 'attendee1pass';

        this.token = localStorage.getItem('token');

        this.bindHandlers();

        $('#app').removeAttr('hidden');
    },
    methods: {
        bindHandlers() {
            $(document).on('click', '.event > .card-header', event => {
                $(event.target).parentsUntil('.col-md-4').find('.card-body').slideToggle();
            });
        },

        login() {
            $.ajax({
                url: this.api_base_uri + '/login',
                method: 'post',
                data: this.auth,
                success: response => {
                    this.token = response.token;
                    this.launchAlert('Welcome back');
                },
                error: () => {
                    this.launchAlert('User or password not correct', 'danger');
                },
            });
        },
        showRegisterForm() {
            $('#registerDropdown').click();
        },
        register() {
            let formData = new FormData;

            formData.append('firstname', this.profile.firstname);
            formData.append('lastname', this.profile.lastname);
            formData.append('email', this.profile.email);
            formData.append('username', this.profile.username);
            formData.append('password', this.profile.password);

            if (this.profile.linkedin_url) {
                formData.append('linkedin_url', this.profile.linkedin_url);
            }

            if ($('#photo')[0].files[0]) {
                formData.append('photo', $('#photo')[0].files[0]);
            }

            $.ajax({
                url: this.api_base_uri + '/profile',
                method: 'post',
                processData: false,
                contentType: false,
                data: formData,
                success: response => {
                    this.token = response.token;
                    this.launchAlert('Nice to meet you!');
                },
                error: xhr => this.launchAlert(xhr.responseJSON.message, 'danger'),
            });
        },
        logout() {
            $.ajax({
                url: this.api_base_uri + '/logout?token=' + this.token,
                success: () => {
                    this.token = '';
                    this.launchAlert('See you!');
                },
            });
        },
        showProfile() {
            $.ajax({
                url: this.api_base_uri + '/profile?token=' + this.token,
                success: response => this.user = response,
                error: () => this.token = '',
            });
        },
        listEvents() {
            $.ajax({
                url: this.api_base_uri + '/events?token=' + this.token,
                success: response => this.events = response,
            });
        },
        listRegistrations() {
            $.ajax({
                url: this.api_base_uri + '/registrations?token=' + this.token,
                success: response => this.registrations = response,
            });
        },
        showEventRegisterModal(event) {
            this.event = event;
            this.registration.event_id = this.event.id;
            this.registration.registration_type = 'general';

            $('#eventRegisterModal').modal('show');
        },
        registerEvent() {
            $.ajax({
                url: this.api_base_uri + '/registrations?token=' + this.token,
                method: 'post',
                data: this.registration,
                success: response => {
                    this.launchAlert(response.message);
                    this.listRegistrations();
                    $('#eventRegisterModal').modal('hide');
                },
            });
        },
        showRegistrations() {
            $('#registrationsModal').modal('show');
        },
        downloadIcal(registration) {
            let event = this.events.find(event => event.id === registration.event_id);

            let dtStart = new Date(event.date);
            let dtEnd = new Date(event.date);
            let dtStamp = new Date(event.date + ' ' + event.time);
            dtEnd.setDate(dtEnd.getDate() + event.duration_days - 1);

            let content =
`BEGIN:VCALENDAR
VERSION:2.0
BEGIN:VEVENT
DTSTART:${ dtStart.toISOString() }
DTEND:${ dtEnd.toISOString() }
DTSTAMP:${ dtStamp.toISOString() }
UID:${ this.user.email }
SUMMARY:${ event.title }
DESCRIPTION:${ event.description }
LOCATION:${ event.location }
END:VEVENT
END:VCALENDAR`;

            let blob = new Blob([
                content,
            ], {
                type: 'text/calendar',
            });
            let url = URL.createObjectURL(blob);
            let link = document.createElement('a');
            link.href = url;
            link.download = 'event.ics';
            document.body.appendChild(link);
            link.click();
            link.remove();
        },
        rateEvent(id, event_rating) {
            $.ajax({
                url: this.api_base_uri + '/registrations/' + id + '?token=' + this.token,
                method: 'put',
                data: {
                    event_rating,
                },
            });
        },

        launchAlert(message, type = 'success') {
            this.alert.message = message;
            this.alert.type = type;

            $('#alertModel').modal('show');
        },
    },
});