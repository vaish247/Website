import ContactForm from '@/components/ContactForm';
import ContactDetails from '@/components/ContactDetails';
import Container from '@/components/Container'; // Default import
import PageIntro from '@/components/PageIntro'; // Default import

export default function ContactPage() {
  return (
    <>
      <PageIntro eyebrow="Contact us" title="Let’s work together">
        <p>We can’t wait to hear from you.</p>
      </PageIntro>

      <Container className="mt-24 sm:mt-32 lg:mt-40">
        <div className="grid grid-cols-1 gap-x-8 gap-y-24 lg:grid-cols-2">
          <ContactForm />
          <ContactDetails />
        </div>
      </Container>
    </>
  );
}
