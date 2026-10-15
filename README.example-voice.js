window.AstonVoice = {
  create(workerBase) {
    const base = String(workerBase || '').replace(/\/+$/, '');
    let current = null;
    return {
      async profiles() {
        return (await fetch(base + '/v1/voice/profiles')).json();
      },
      async speak(text, profile) {
        if (current) { try { current.pause(); } catch (_) {} current = null; }
        const r = await fetch(base + '/v1/voice', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json', Accept: 'audio/mpeg' },
          body: JSON.stringify({ text, profile: profile || 'aston_executive' })
        });
        if (!r.ok) throw new Error('Voice HTTP ' + r.status);
        const url = URL.createObjectURL(await r.blob());
        const audio = new Audio(url);
        current = audio;
        audio.onended = () => URL.revokeObjectURL(url);
        await audio.play();
        return audio;
      },
      stop() { if (current) { current.pause(); current = null; } }
    };
  }
};
